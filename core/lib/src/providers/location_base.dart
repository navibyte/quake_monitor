// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Absctract base class for location providers.

import 'dart:async';

import '../models/geo.dart';

// LocationProvider provides data access methods for place searches.
abstract class LocationProvider {

  Future<GeoPoint> searchPlace(String place);

}