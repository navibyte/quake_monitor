// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Earthquake domain model in Dart. Note some classes are commented out as
// not needed for this version of the app.

import 'package:equatable/equatable.dart';

import 'geo.dart';

// Alert according to https://earthquake.usgs.gov/data/pager/background.php
enum Alert { unspecified, red, orange, yellow, green }

// USGS docs: "Status indicates whether the event has been reviewed by a human".
// enum Status { automatic, reviewed, deleted }

// USGS docs: "Type indicates the type of a seismic event".
// enum Type { earthquake, quarry }

// Earthquake feature with position (point geometry) and some key properties.
class Earthquake extends Equatable {
  final String id;  
  final GeoPoint position;
  final double magnitude;
  final String place;
  final DateTime time;
  final DateTime updatedTime;
  final int timezoneOffset;
  final Alert alert;
  final int significance;
  //final EarthquakeDetails details;
  final double distance;

  const Earthquake({
    this.id,
    this.position,
    this.magnitude,
    this.place,
    this.time,
    this.updatedTime,
    this.timezoneOffset,
    this.alert,
    this.significance,
    //this.details,
    this.distance,
  });

  @override
  List<Object> get props => [
    id,
    position,
    magnitude,
    place,
    time,
    updatedTime,
    timezoneOffset,
    alert,
    significance,
    //details,
    distance,
  ];
}

/*

// Following classes commented out for the current version.

// Earthquake detailed properties.
class EarthquakeDetails extends Equatable {
  final String id;  
  final String url;
  final String detailFeedUrl;
  final int felt;
  final double reportedIntensity;
  final double estimatedIntensity;
  final Status status;
  final bool tsunami;
  final String network;
  final String code;
  final String ids;
  final String sources;
  final String productTypes;
  final int nst;
  final double dmin;
  final double rms;
  final double gap;
  final String magType;
  final Type type;
  
  const EarthquakeDetails({
    this.id,
    this.url,
    this.detailFeedUrl,
    this.felt,
    this.reportedIntensity,
    this.estimatedIntensity,
    this.status,
    this.tsunami,
    this.network,
    this.code,
    this.ids,
    this.sources,
    this.productTypes,
    this.nst,
    this.dmin,
    this.rms,
    this.gap,
    this.magType,
    this.type,
  });

  @override
  List<Object> get props => [
    id,
    url,
    detailFeedUrl,
    felt,
    reportedIntensity,
    estimatedIntensity,
    status,
    tsunami,
    network,
    code,
    ids,
    sources,
    productTypes,
    nst,
    dmin,
    rms,
    gap,
    magType,
    type,
  ];
}

// EarthquakeCollection represents a feature collection of earthquakes based on 
// the "GeoJSON Summary Format" of the USGS Earthquake Hazards program.
class EarthquakeCollection extends Equatable {
  final EarthquakeMetadata metadata;
  final GeoBounds bounds;
  final List<Earthquake> features;

  const EarthquakeCollection({
    this.metadata,
    this.bounds,
    this.features,
  });

  @override
  List<Object> get props => [
    metadata,
    bounds,
    features,
  ];
}

// EarthquakeMetadata contains meta data for a set of earthquakes.
class EarthquakeMetadata extends Equatable {
  final DateTime generatedTime;
  final String url;
  final String title;
  final String api;
  final int count;
  final String httpStatus;

  const EarthquakeMetadata({
    this.generatedTime,
    this.url,
    this.title,
    this.api,
    this.count,
    this.httpStatus,
  });

  @override
  List<Object> get props => [
    generatedTime,
    url,
    title,
    api,
    count,
    httpStatus,
  ];
}
*/