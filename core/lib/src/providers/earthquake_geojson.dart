// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Data provider to access earthquakes directly from RESTful service for
// earthquakes (provided by the USGS) that's serving GeoJSON data.
//
// See description about the USGS service:
// https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php

import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/geo.dart';
import '../models/earthquake.dart';
import '../utils/math.dart';

import 'earthquake_base.dart';

// EarthquakeProviderGeoJSON accesses earthquakes from the GeoJSON service of USGS.
class EarthquakeProviderGeoJSON implements EarthquakeProvider {
  static const apiBaseURL =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/';
  static const apiBaseURLPostfix = '.geojson';
  final http.Client httpClient;

  EarthquakeProviderGeoJSON({@required this.httpClient})
      : assert(httpClient != null);

  @override
  Future<List<Earthquake>> getSignificant(int limit) {
    return _fetchList('significant_month', limit);
  }

  @override
  Future<List<Earthquake>> getLatest(int limit) {
    return _fetchList('all_hour', limit);
  }

  @override
  Future<List<Earthquake>> getNearby(GeoPoint focus, int limit) {
    return _fetchList('2.5_month', limit, focus: focus);
  }

  Future<List<Earthquake>> _fetchList(String resource, int limit,
      {GeoPoint focus}) async {
    final url = '${apiBaseURL}${resource}${apiBaseURLPostfix}';
    try {
      final res = await httpClient.get(url);
      if (res.statusCode == 200) {
        final root = jsonDecode(res.body);
        if (root.isNotEmpty && root['type'] == 'FeatureCollection') {
          final features = root['features'] as List;
          if (features != null) {
            final list = List<Earthquake>();

            for (final f in features) {
              // if no position given then do not parse more earthquakes than limit
              if (focus == null && list.length >= limit) break;

              // parse earthquake from GeoJSON and add it to the list
              // (if focus != null, then also distance is calculated)
              list.add(_parseEarthquake(f, focus: focus));
            }

            // sort and take earthquakes most near to focus point
            if(focus != null) {
              list.sort((a, b) => a.distance.compareTo(b.distance));  
              if(list.length > limit) {
                return list.sublist(0, limit);
              }
            }

            return list;
          }
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }

    throw Exception('failed to read earthquakes from a web service');
  }

  Earthquake _parseEarthquake(Map<String, dynamic> f, {GeoPoint focus}) {
    final coords = f['geometry']['coordinates'] as List;
    final pos = GeoPoint(
        // coordinates in USGS GeoJSON has order [longitude, latitude, depth]
        latitude: clipDouble(_convertDouble(coords[1]), -90.0, 90.0),
        longitude: clipDouble(_convertDouble(coords[0]), -180.0, 180.0),
        height:
            _convertDouble(coords[2]) * (-1000.0), // Depth (km) => Height (m)
      );
    final prop = f['properties'];
    final eq = Earthquake(
      id: f['id'],
      position: pos,
      magnitude: _convertDouble(prop['mag']),
      place: prop['place'],
      time: _convertTime(prop['time']),
      updatedTime: _convertTime(prop['updated']),
      timezoneOffset: _convertInt(prop['tz']),
      alert: _convertAlert(prop['alert']),
      significance: _convertInt(prop['sig']),
      distance: focus != null ? pos.distanceTo(focus) : null,  
    );

    //print(
    //    'parsed ${eq.id} ${eq.position.latitude} ${eq.position.longitude} ${eq.position.height} ${eq.magnitude} ${eq.place} ${eq.time} ${eq.updatedTime} ${eq.timezoneOffset} ${eq.alert} ${eq.significance}');
    return eq;
  }

  double _convertDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is String) {
      return double.parse(value);
    }
    return 0.0;
  }

  int _convertInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.round();
    } else if (value is String) {
      return int.parse(value);
    }
    return 0;
  }

  DateTime _convertTime(int millis) {
    if (millis == null) return null;
    // expecting integer milliseconds
    return DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
  }

  Alert _convertAlert(String alert) {
    if (alert != null) {
      switch (alert) {
        case 'red':
          return Alert.red;
        case 'orange':
          return Alert.orange;
        case 'yellow':
          return Alert.yellow;
        case 'green':
          return Alert.green;
      }
    }

    // for the model's Alert we assume the default is unspesified.
    return Alert.unspecified;
  }
}
