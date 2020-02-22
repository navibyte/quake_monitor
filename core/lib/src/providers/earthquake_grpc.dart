// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Data provider to access earthquakes from a gRPC service that proxies and 
// caches data accessed from the USGS service (GeoJSON).
//
// The implementation uses EarthquakeApiClient from the "api" project.

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

import 'package:api/api.dart' as $api;

import '../models/geo.dart';
import '../models/earthquake.dart';

import 'earthquake_base.dart';

// EarthquakeProviderGRPC accesses earthquakes from the QuakeService (gRPC).
class EarthquakeProviderGRPC implements EarthquakeProvider {
  final $api.EarthquakeApiClient _client;

  EarthquakeProviderGRPC(
      {@required address, @required port, @required isSecure})
      : _client = $api.EarthquakeApiClient(
            address: address, port: port, isSecure: isSecure);

  @override
  Future<List<Earthquake>> getSignificant(int limit) async {
    final channel = await _client.open();
    try {
      final col = await channel.listEarthquakes(
          magnitude: $api.Magnitude.MAGNITUDE_SIGNIFICANT,
          past: $api.Past.PAST_30DAYS,
          limit: limit,
          details: false);
      return _convertEarthquakeCollection(col, limit);
    } finally {
      await channel.shutdown();
    }
  }

  @override
  Future<List<Earthquake>> getLatest(int limit) async {
    final channel = await _client.open();
    try {
      final col = await channel.listEarthquakes(
          magnitude: $api.Magnitude.MAGNITUDE_ALL,
          past: $api.Past.PAST_HOUR,
          limit: limit,
          details: false);
      return _convertEarthquakeCollection(col, limit);
    } finally {
      await channel.shutdown();
    }
  }

  @override
  Future<List<Earthquake>> getNearby(GeoPoint focus, int limit) async {
    // use api client to fetch earthquakes
    final channel = await _client.open();
    try {
      final col = await channel.listEarthquakes(
          magnitude: $api.Magnitude.MAGNITUDE_M25_PLUS,
          past: $api.Past.PAST_30DAYS,
          limit: limit,
          details: false,
          position: _convertGeoPointToE7(focus));
      return _convertEarthquakeCollection(col, limit);
    } finally {
      await channel.shutdown();
    }
  }

  List<Earthquake> _convertEarthquakeCollection(
      $api.EarthquakeCollection col, int limit) {
    return [
      for (var i = 0; i < limit && i < col.features.length; i++)
        _convertEarthquake(col.features[i])
    ];
  }

  Earthquake _convertEarthquake($api.Earthquake eq) {
    if (eq == null) return null;

    // convert API's Earthquake to model's Earthquake
    return Earthquake(
      id: eq.id,
      position: _convertGeoPointFromE7(eq.position),
      magnitude: eq.magnitude,
      place: eq.place,
      time: _convertTime(eq.time),
      updatedTime: _convertTime(eq.updatedTime),
      timezoneOffset: eq.timezoneOffset,
      alert: _convertAlert(eq.alert),
      significance: eq.significance,
    );
  }

  DateTime _convertTime($fixnum.Int64 timeSeconds) {
    if (timeSeconds == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(timeSeconds.toInt() * 1000,
        isUtc: true);
  }

  GeoPoint _convertGeoPointFromE7($api.GeoPointE7 p) {
    if (p == null) return null;

    // api uses E7 integer format for latitude and longitude, cm for height
    // return double degrees for latitude and longitude, meters for height
    return GeoPoint(
      latitude: p.latitude / 1e7,
      longitude: p.longitude / 1e7,
      height: p.height / 100.0,
    );
  }

  $api.GeoPointE7 _convertGeoPointToE7(GeoPoint p) {
    if (p == null) return null;
    return $api.GeoPointE7()
      ..latitude = (p.latitude * 1e7).round()
      ..longitude = (p.longitude * 1e7).round()
      ..height = (p.height * 100.0).round();
  }

  Alert _convertAlert($api.Alert alert) {
    // well this is boilerplate if anything but model's Alert is different
    // enum than api's Alert so must convert em'...
    if (alert != null) {
      switch (alert) {
        case $api.Alert.ALERT_RED:
          return Alert.red;
        case $api.Alert.ALERT_ORANGE:
          return Alert.orange;
        case $api.Alert.ALERT_YELLOW:
          return Alert.yellow;
        case $api.Alert.ALERT_GREEN:
          return Alert.green;
      }
    }

    // for the model's Alert we assume the default is unspesified.
    return Alert.unspecified;
  }
}
