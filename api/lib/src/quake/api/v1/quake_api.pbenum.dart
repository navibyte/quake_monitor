///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake_api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Magnitude extends $pb.ProtobufEnum {
  static const Magnitude MAGNITUDE_UNSPECIFIED = Magnitude._(0, 'MAGNITUDE_UNSPECIFIED');
  static const Magnitude MAGNITUDE_SIGNIFICANT = Magnitude._(1, 'MAGNITUDE_SIGNIFICANT');
  static const Magnitude MAGNITUDE_M45_PLUS = Magnitude._(2, 'MAGNITUDE_M45_PLUS');
  static const Magnitude MAGNITUDE_M25_PLUS = Magnitude._(3, 'MAGNITUDE_M25_PLUS');
  static const Magnitude MAGNITUDE_M10_PLUS = Magnitude._(4, 'MAGNITUDE_M10_PLUS');
  static const Magnitude MAGNITUDE_ALL = Magnitude._(5, 'MAGNITUDE_ALL');

  static const $core.List<Magnitude> values = <Magnitude> [
    MAGNITUDE_UNSPECIFIED,
    MAGNITUDE_SIGNIFICANT,
    MAGNITUDE_M45_PLUS,
    MAGNITUDE_M25_PLUS,
    MAGNITUDE_M10_PLUS,
    MAGNITUDE_ALL,
  ];

  static final $core.Map<$core.int, Magnitude> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Magnitude valueOf($core.int value) => _byValue[value];

  const Magnitude._($core.int v, $core.String n) : super(v, n);
}

class Past extends $pb.ProtobufEnum {
  static const Past PAST_UNSPECIFIED = Past._(0, 'PAST_UNSPECIFIED');
  static const Past PAST_HOUR = Past._(1, 'PAST_HOUR');
  static const Past PAST_DAY = Past._(2, 'PAST_DAY');
  static const Past PAST_7DAYS = Past._(3, 'PAST_7DAYS');
  static const Past PAST_30DAYS = Past._(4, 'PAST_30DAYS');

  static const $core.List<Past> values = <Past> [
    PAST_UNSPECIFIED,
    PAST_HOUR,
    PAST_DAY,
    PAST_7DAYS,
    PAST_30DAYS,
  ];

  static final $core.Map<$core.int, Past> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Past valueOf($core.int value) => _byValue[value];

  const Past._($core.int v, $core.String n) : super(v, n);
}

