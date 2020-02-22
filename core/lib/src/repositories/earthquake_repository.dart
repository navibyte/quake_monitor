// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

import 'dart:async';

import 'package:meta/meta.dart';

import 'package:core/core.dart';

import '../models/earthquake.dart';
import '../providers/location_base.dart';
import '../providers/earthquake_base.dart';

// A repository for earthquakes.
// The instance is configured with location and earthquake providers.
class EarthquakeRepository {
  final EarthquakeProvider earthquakeProvider;
  final LocationProvider locationProvider;

  EarthquakeRepository(
      {@required this.earthquakeProvider, @required this.locationProvider})
      : assert(earthquakeProvider != null && locationProvider != null);

  Future<List<Earthquake>> getSignificant(int limit) async {
    // just proxy to the earthquake provider
    return await earthquakeProvider.getSignificant(limit);
  }

  Future<List<Earthquake>> getLatest(int limit) async {
    // just proxy to the earthquake provider
    return await earthquakeProvider.getLatest(limit);
  }

  Future<List<Earthquake>> getNear(String place, int limit) async {
    // first get coordinates near the place from the location provider
    final pos = await locationProvider.searchPlace(place);
    //print('Got location ${pos.latitude} ${pos.longitude}');

    //final pos = GeoPoint(latitude: 50, longitude: 21, height: 0);

    // then use earthquake provider to fetch earthquakes
    return await earthquakeProvider.getNearby(pos, limit);
  }
}
