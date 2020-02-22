// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Data provider to fetch a location for a city.
//
// This sample implementation uses https://www.metaweather.com API for queries.
//
// For example: https://www.metaweather.com/api/location/search/?query=london =>
// [{"title":"London","location_type":"City","woeid":44418,
//   "latt_long":"51.506321,-0.12714"}]
//
// Note because of lacking CORS support on www.metaweather.com this provider
// does not work on Flutter Web releases.
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/geo.dart';
import '../utils/math.dart';
import '../providers/location_base.dart';

// LocationProviderMetaWeather accesses place searches from the Meta Weather.
class LocationProviderMetaWeather implements LocationProvider {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  LocationProviderMetaWeather({@required this.httpClient})
      : assert(httpClient != null);

  @override
  Future<GeoPoint> searchPlace(String place) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$place';

    final locationResponse = await httpClient.get(locationUrl);
    if (locationResponse.statusCode != 200) {
      throw Exception('failed to find a place');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    if (locationJson.isEmpty) {
      throw Exception('failed to find a place');
    }
    String latlon = (locationJson.first)['latt_long'];
    if (latlon != null) {
      final parts = latlon.split(',');
      if (parts.length == 2) {
        final lat = double.parse(parts[0]);
        final lon = double.parse(parts[1]);
        return GeoPoint(
            latitude: clipDouble(lat, -90.0, 90.0),
            longitude: clipDouble(lon, -180.0, 180.0),
            height: 0.0);
      }
    }

    throw Exception('failed to find a place because of invalid data');
  }
}
