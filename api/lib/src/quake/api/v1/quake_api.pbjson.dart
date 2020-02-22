///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake_api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Magnitude$json = const {
  '1': 'Magnitude',
  '2': const [
    const {'1': 'MAGNITUDE_UNSPECIFIED', '2': 0},
    const {'1': 'MAGNITUDE_SIGNIFICANT', '2': 1},
    const {'1': 'MAGNITUDE_M45_PLUS', '2': 2},
    const {'1': 'MAGNITUDE_M25_PLUS', '2': 3},
    const {'1': 'MAGNITUDE_M10_PLUS', '2': 4},
    const {'1': 'MAGNITUDE_ALL', '2': 5},
  ],
};

const Past$json = const {
  '1': 'Past',
  '2': const [
    const {'1': 'PAST_UNSPECIFIED', '2': 0},
    const {'1': 'PAST_HOUR', '2': 1},
    const {'1': 'PAST_DAY', '2': 2},
    const {'1': 'PAST_7DAYS', '2': 3},
    const {'1': 'PAST_30DAYS', '2': 4},
  ],
};

const ListEarthquakesRequest$json = const {
  '1': 'ListEarthquakesRequest',
  '2': const [
    const {'1': 'magnitude', '3': 1, '4': 1, '5': 14, '6': '.quake.api.v1.Magnitude', '10': 'magnitude'},
    const {'1': 'past', '3': 2, '4': 1, '5': 14, '6': '.quake.api.v1.Past', '10': 'past'},
    const {'1': 'limit', '3': 3, '4': 1, '5': 4, '10': 'limit'},
    const {'1': 'details', '3': 4, '4': 1, '5': 8, '10': 'details'},
    const {'1': 'position', '3': 5, '4': 1, '5': 11, '6': '.quake.api.v1.GeoPointE7', '9': 0, '10': 'position'},
    const {'1': 'bounds', '3': 6, '4': 1, '5': 11, '6': '.quake.api.v1.GeoBoundsE7', '9': 0, '10': 'bounds'},
  ],
  '8': const [
    const {'1': 'focus'},
  ],
};

const ListEarthquakesResponse$json = const {
  '1': 'ListEarthquakesResponse',
  '2': const [
    const {'1': 'collection', '3': 1, '4': 1, '5': 11, '6': '.quake.api.v1.EarthquakeCollection', '10': 'collection'},
  ],
};

const GetEarthquakeRequest$json = const {
  '1': 'GetEarthquakeRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'details', '3': 2, '4': 1, '5': 8, '10': 'details'},
  ],
};

const GetEarthquakeResponse$json = const {
  '1': 'GetEarthquakeResponse',
  '2': const [
    const {'1': 'feature', '3': 1, '4': 1, '5': 11, '6': '.quake.api.v1.Earthquake', '10': 'feature'},
  ],
};

