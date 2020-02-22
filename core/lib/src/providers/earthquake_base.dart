// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Absctract base class for earthquake data providers.

import 'dart:async';

import '../models/geo.dart';
import '../models/earthquake.dart';

// EarthquakeProvider provides data access methods for earthquakes.
abstract class EarthquakeProvider {

  Future<List<Earthquake>> getSignificant(int limit);

  Future<List<Earthquake>> getLatest(int limit);

  Future<List<Earthquake>> getNearby(GeoPoint focus, int limit);

}