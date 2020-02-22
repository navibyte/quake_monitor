///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Alert extends $pb.ProtobufEnum {
  static const Alert ALERT_UNSPECIFIED = Alert._(0, 'ALERT_UNSPECIFIED');
  static const Alert ALERT_RED = Alert._(1, 'ALERT_RED');
  static const Alert ALERT_ORANGE = Alert._(2, 'ALERT_ORANGE');
  static const Alert ALERT_YELLOW = Alert._(3, 'ALERT_YELLOW');
  static const Alert ALERT_GREEN = Alert._(4, 'ALERT_GREEN');

  static const $core.List<Alert> values = <Alert> [
    ALERT_UNSPECIFIED,
    ALERT_RED,
    ALERT_ORANGE,
    ALERT_YELLOW,
    ALERT_GREEN,
  ];

  static final $core.Map<$core.int, Alert> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Alert valueOf($core.int value) => _byValue[value];

  const Alert._($core.int v, $core.String n) : super(v, n);
}

class Status extends $pb.ProtobufEnum {
  static const Status STATUS_UNSPECIFIED = Status._(0, 'STATUS_UNSPECIFIED');
  static const Status STATUS_AUTOMATIC = Status._(1, 'STATUS_AUTOMATIC');
  static const Status STATUS_REVIEWED = Status._(2, 'STATUS_REVIEWED');
  static const Status STATUS_DELETED = Status._(3, 'STATUS_DELETED');

  static const $core.List<Status> values = <Status> [
    STATUS_UNSPECIFIED,
    STATUS_AUTOMATIC,
    STATUS_REVIEWED,
    STATUS_DELETED,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}

class Type extends $pb.ProtobufEnum {
  static const Type TYPE_UNSPECIFIED = Type._(0, 'TYPE_UNSPECIFIED');
  static const Type TYPE_EARTHQUAKE = Type._(1, 'TYPE_EARTHQUAKE');
  static const Type TYPE_QUARRY = Type._(2, 'TYPE_QUARRY');

  static const $core.List<Type> values = <Type> [
    TYPE_UNSPECIFIED,
    TYPE_EARTHQUAKE,
    TYPE_QUARRY,
  ];

  static final $core.Map<$core.int, Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Type valueOf($core.int value) => _byValue[value];

  const Type._($core.int v, $core.String n) : super(v, n);
}

