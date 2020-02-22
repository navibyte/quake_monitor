// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Data provider to fetch a location for a place.
//
// This implementation uses GeoNames web service API for queries.
// See: http://www.geonames.org/export/
//
// For example: http://api.geonames.org/searchJSON?formatted=true&name=londonus&fuzzy=0.7&maxRows=1&username=demo&style=short
//   {
//     "totalResultsCount": 16,
//     "geonames": [{
//       "lng": "-0.12574",
//       "geonameId": 2643743,
//       "countryCode": "GB",
//       "name": "London",
//       "toponymName": "London",
//       "lat": "51.50853",
//       "fcl": "P",
//       "fcode": "PPLC"
//     }]
//   }

import 'dart:convert';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/geo.dart';
import '../utils/math.dart';
import '../providers/location_base.dart';

// LocationProviderGeoNames accesses place searches from the GeoNames.org.
// Please note a registered username is needed to use that service.
class LocationProviderGeoNames implements LocationProvider {
  // insecure API endpoint - causes block when running app on browser
  // static const baseUrl = 'http://api.geonames.org/searchJSON';

  // secure API endpoint
  static const baseUrl = 'https://secure.geonames.org/searchJSON';

  final String username;

  LocationProviderGeoNames({@required this.username})
      : assert(username != null);

  @override
  Future<GeoPoint> searchPlace(String place) async {
    // if no user name is set then GeoNames.org cannot be called
    if(username.isEmpty) {
      throw Exception('username for GeoNames.org is not set by your developer');
    }

    final url = Uri.encodeFull(
        '$baseUrl?formatted=true&name=$place&fuzzy=0.7&maxRows=1&username=$username&style=short');

    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        final root = jsonDecode(res.body);
        if (root.isNotEmpty) {
          final features = root['geonames'] as List;
          if (features != null && features.isNotEmpty) {
            final f = features[0];
            final lat = _convertDouble(f['lat']);
            final lon = _convertDouble(f['lng']);
            return GeoPoint(
                latitude: clipDouble(lat, -90.0, 90.0),
                longitude: clipDouble(lon, -180.0, 180.0),
                height: 0.0);
          }
        }
      }
    } catch (e, s) {
      print(e);
      print(s);
    }

    throw Exception('did not find a location for "$place"');
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
}
