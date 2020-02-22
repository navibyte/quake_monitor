///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Alert$json = const {
  '1': 'Alert',
  '2': const [
    const {'1': 'ALERT_UNSPECIFIED', '2': 0},
    const {'1': 'ALERT_RED', '2': 1},
    const {'1': 'ALERT_ORANGE', '2': 2},
    const {'1': 'ALERT_YELLOW', '2': 3},
    const {'1': 'ALERT_GREEN', '2': 4},
  ],
};

const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'STATUS_UNSPECIFIED', '2': 0},
    const {'1': 'STATUS_AUTOMATIC', '2': 1},
    const {'1': 'STATUS_REVIEWED', '2': 2},
    const {'1': 'STATUS_DELETED', '2': 3},
  ],
};

const Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'TYPE_EARTHQUAKE', '2': 1},
    const {'1': 'TYPE_QUARRY', '2': 2},
  ],
};

const EarthquakeCollection$json = const {
  '1': 'EarthquakeCollection',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.quake.api.v1.EarthquakeMetadata', '10': 'metadata'},
    const {'1': 'bounds', '3': 2, '4': 1, '5': 11, '6': '.quake.api.v1.GeoBoundsE7', '10': 'bounds'},
    const {'1': 'features', '3': 3, '4': 3, '5': 11, '6': '.quake.api.v1.Earthquake', '10': 'features'},
  ],
};

const Earthquake$json = const {
  '1': 'Earthquake',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'position', '3': 2, '4': 1, '5': 11, '6': '.quake.api.v1.GeoPointE7', '10': 'position'},
    const {'1': 'magnitude', '3': 3, '4': 1, '5': 2, '10': 'magnitude'},
    const {'1': 'place', '3': 4, '4': 1, '5': 9, '10': 'place'},
    const {'1': 'time', '3': 5, '4': 1, '5': 3, '10': 'time'},
    const {'1': 'updated_time', '3': 6, '4': 1, '5': 3, '10': 'updatedTime'},
    const {'1': 'timezone_offset', '3': 7, '4': 1, '5': 17, '10': 'timezoneOffset'},
    const {'1': 'alert', '3': 8, '4': 1, '5': 14, '6': '.quake.api.v1.Alert', '10': 'alert'},
    const {'1': 'significance', '3': 9, '4': 1, '5': 5, '10': 'significance'},
    const {'1': 'details', '3': 10, '4': 1, '5': 11, '6': '.quake.api.v1.EarthquakeDetails', '10': 'details'},
  ],
};

const EarthquakeDetails$json = const {
  '1': 'EarthquakeDetails',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'detail_feed_url', '3': 3, '4': 1, '5': 9, '10': 'detailFeedUrl'},
    const {'1': 'felt', '3': 4, '4': 1, '5': 5, '10': 'felt'},
    const {'1': 'reported_intensity', '3': 5, '4': 1, '5': 2, '10': 'reportedIntensity'},
    const {'1': 'estimated_intensity', '3': 6, '4': 1, '5': 2, '10': 'estimatedIntensity'},
    const {'1': 'status', '3': 7, '4': 1, '5': 14, '6': '.quake.api.v1.Status', '10': 'status'},
    const {'1': 'tsunami', '3': 8, '4': 1, '5': 8, '10': 'tsunami'},
    const {'1': 'network', '3': 9, '4': 1, '5': 9, '10': 'network'},
    const {'1': 'code', '3': 10, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'ids', '3': 11, '4': 1, '5': 9, '10': 'ids'},
    const {'1': 'sources', '3': 12, '4': 1, '5': 9, '10': 'sources'},
    const {'1': 'product_types', '3': 13, '4': 1, '5': 9, '10': 'productTypes'},
    const {'1': 'nst', '3': 14, '4': 1, '5': 5, '10': 'nst'},
    const {'1': 'dmin', '3': 15, '4': 1, '5': 2, '10': 'dmin'},
    const {'1': 'rms', '3': 16, '4': 1, '5': 2, '10': 'rms'},
    const {'1': 'gap', '3': 17, '4': 1, '5': 2, '10': 'gap'},
    const {'1': 'mag_type', '3': 18, '4': 1, '5': 9, '10': 'magType'},
    const {'1': 'type', '3': 19, '4': 1, '5': 14, '6': '.quake.api.v1.Type', '10': 'type'},
  ],
};

const EarthquakeMetadata$json = const {
  '1': 'EarthquakeMetadata',
  '2': const [
    const {'1': 'generated_time', '3': 1, '4': 1, '5': 3, '10': 'generatedTime'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'api', '3': 4, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'count', '3': 5, '4': 1, '5': 5, '10': 'count'},
    const {'1': 'http_status', '3': 6, '4': 1, '5': 9, '10': 'httpStatus'},
  ],
};

const GeoBoundsE7$json = const {
  '1': 'GeoBoundsE7',
  '2': const [
    const {'1': 'min_latitude', '3': 1, '4': 1, '5': 15, '10': 'minLatitude'},
    const {'1': 'min_longitude', '3': 2, '4': 1, '5': 15, '10': 'minLongitude'},
    const {'1': 'min_height', '3': 3, '4': 1, '5': 17, '10': 'minHeight'},
    const {'1': 'max_latitude', '3': 4, '4': 1, '5': 15, '10': 'maxLatitude'},
    const {'1': 'max_longitude', '3': 5, '4': 1, '5': 15, '10': 'maxLongitude'},
    const {'1': 'max_height', '3': 6, '4': 1, '5': 17, '10': 'maxHeight'},
  ],
};

const GeoPointE7$json = const {
  '1': 'GeoPointE7',
  '2': const [
    const {'1': 'latitude', '3': 1, '4': 1, '5': 15, '10': 'latitude'},
    const {'1': 'longitude', '3': 2, '4': 1, '5': 15, '10': 'longitude'},
    const {'1': 'height', '3': 3, '4': 1, '5': 17, '10': 'height'},
  ],
};

