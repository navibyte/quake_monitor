// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

// Formatters for earthquake data

import '../models/units.dart';

String formatMagnitude(double magn) {
  return magn == null ? '?' : 'M ${magn.toStringAsFixed(1)}';
}

String formatDistance(double meters, {UnitSystem units}) {
  if (meters != null) {
    switch (units ?? UnitSystem.metric) {
      case UnitSystem.metric:
        if (meters.abs() < 1000.0) {
          return meters.toStringAsFixed(0) + ' m';
        }
        return (meters / 1000.0).toStringAsFixed(0) + ' km';
      case UnitSystem.imperial:
        if (meters.abs() < 1609.0) {
          return (meters / 0.3048).toStringAsFixed(0) + ' ft';
        }
        return (meters / 1609.0).toStringAsFixed(0) + ' mi';
    }
  }

  return '?';
}

String formatPlaceText(String text, {UnitSystem units}) {
  if (text != null) {
    final i = text.indexOf('km ');
    if (i > 0 && i + 3 < text.length) {
      // transform "18km SE of Some Place" => "16 km SE of Some Place" if metric
      // or to "10 mi SE of Some Place" if imperial
      switch (units ?? UnitSystem.metric) {
        case UnitSystem.metric:
          return text.substring(0, i) + ' km ' + text.substring(i+3);
        case UnitSystem.imperial:
          final miles = double.tryParse(text.substring(0, i)) / 1.609 ?? 0.0;
          return miles.toStringAsFixed(0) + ' mi ' + text.substring(i+3);
      }
    }
    return text;
  }

  return '?';
}
