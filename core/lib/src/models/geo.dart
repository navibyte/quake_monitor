// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Geographic data structures for position and bounds.

import 'dart:math';

import 'package:equatable/equatable.dart';

// GeoPoint is a geographic point (WGS84 latitude and longitude, 
// height is meters with negative values meaning depth).
class GeoPoint extends Equatable {
  final double latitude;  
  final double longitude;  
  final double height;  

  const GeoPoint({
    this.latitude,  
    this.longitude,  
    this.height,
  });
  
  @override
  List<Object> get props => [
    latitude,  
    longitude,  
    height,
  ];

  double distanceTo(GeoPoint other) {
    return _distance(latitude, longitude, other.latitude, other.longitude);
  }
}

// GeoBounds is a geographic bounding box (WGS84 latitude and longitude, 
// height is meters with negative values meaning depth).
class GeoBounds extends Equatable {
  final double minLatitude;  
  final double minLongitude;  
  final double minHeight;  
  final double maxLatitude;  
  final double maxLongitude;  
  final double maxHeight;  

  const GeoBounds({
    this.minLatitude,  
    this.minLongitude,  
    this.minHeight,
    this.maxLatitude,  
    this.maxLongitude,  
    this.maxHeight,
  });
  
  @override
  List<Object> get props => [
    minLatitude,  
    minLongitude,  
    minHeight,
    maxLatitude,  
    maxLongitude,  
    maxHeight,
  ];
}

// Distance returns a distance between two points. Result is meters.
double _distance(double lat1, lon1, lat2, lon2) {
	// using "haversine" formula
	// see: http://mathforum.org/library/drmath/view/51879.html
	
	const earthRadius = 6371000.0;
  const toRad = pi / 180.0;

	final lat1Rad = lat1 * toRad;
	final lat2Rad = lat2 * toRad;
	final dlat = (lat2 - lat1) * toRad;
	final dlon = (lon2 - lon1) * toRad;
 	final a = sin(dlat/2) * sin(dlat/2) + 
		 cos(lat1Rad) * cos(lat2Rad) * 
		 sin(dlon/2) * sin(dlon/2);
  final c = 2 * atan2(sqrt(a), sqrt(1-a)); 
	
	return earthRadius * c;
}