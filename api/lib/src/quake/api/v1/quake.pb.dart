///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'quake.pbenum.dart';

export 'quake.pbenum.dart';

class EarthquakeCollection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EarthquakeCollection', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOM<EarthquakeMetadata>(1, 'metadata', subBuilder: EarthquakeMetadata.create)
    ..aOM<GeoBoundsE7>(2, 'bounds', subBuilder: GeoBoundsE7.create)
    ..pc<Earthquake>(3, 'features', $pb.PbFieldType.PM, subBuilder: Earthquake.create)
    ..hasRequiredFields = false
  ;

  EarthquakeCollection._() : super();
  factory EarthquakeCollection() => create();
  factory EarthquakeCollection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EarthquakeCollection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EarthquakeCollection clone() => EarthquakeCollection()..mergeFromMessage(this);
  EarthquakeCollection copyWith(void Function(EarthquakeCollection) updates) => super.copyWith((message) => updates(message as EarthquakeCollection));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EarthquakeCollection create() => EarthquakeCollection._();
  EarthquakeCollection createEmptyInstance() => create();
  static $pb.PbList<EarthquakeCollection> createRepeated() => $pb.PbList<EarthquakeCollection>();
  @$core.pragma('dart2js:noInline')
  static EarthquakeCollection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EarthquakeCollection>(create);
  static EarthquakeCollection _defaultInstance;

  @$pb.TagNumber(1)
  EarthquakeMetadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(EarthquakeMetadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  EarthquakeMetadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  GeoBoundsE7 get bounds => $_getN(1);
  @$pb.TagNumber(2)
  set bounds(GeoBoundsE7 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBounds() => $_has(1);
  @$pb.TagNumber(2)
  void clearBounds() => clearField(2);
  @$pb.TagNumber(2)
  GeoBoundsE7 ensureBounds() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<Earthquake> get features => $_getList(2);
}

class Earthquake extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Earthquake', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOM<GeoPointE7>(2, 'position', subBuilder: GeoPointE7.create)
    ..a<$core.double>(3, 'magnitude', $pb.PbFieldType.OF)
    ..aOS(4, 'place')
    ..aInt64(5, 'time')
    ..aInt64(6, 'updatedTime')
    ..a<$core.int>(7, 'timezoneOffset', $pb.PbFieldType.OS3)
    ..e<Alert>(8, 'alert', $pb.PbFieldType.OE, defaultOrMaker: Alert.ALERT_UNSPECIFIED, valueOf: Alert.valueOf, enumValues: Alert.values)
    ..a<$core.int>(9, 'significance', $pb.PbFieldType.O3)
    ..aOM<EarthquakeDetails>(10, 'details', subBuilder: EarthquakeDetails.create)
    ..hasRequiredFields = false
  ;

  Earthquake._() : super();
  factory Earthquake() => create();
  factory Earthquake.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Earthquake.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Earthquake clone() => Earthquake()..mergeFromMessage(this);
  Earthquake copyWith(void Function(Earthquake) updates) => super.copyWith((message) => updates(message as Earthquake));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Earthquake create() => Earthquake._();
  Earthquake createEmptyInstance() => create();
  static $pb.PbList<Earthquake> createRepeated() => $pb.PbList<Earthquake>();
  @$core.pragma('dart2js:noInline')
  static Earthquake getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Earthquake>(create);
  static Earthquake _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  GeoPointE7 get position => $_getN(1);
  @$pb.TagNumber(2)
  set position(GeoPointE7 v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);
  @$pb.TagNumber(2)
  GeoPointE7 ensurePosition() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get magnitude => $_getN(2);
  @$pb.TagNumber(3)
  set magnitude($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMagnitude() => $_has(2);
  @$pb.TagNumber(3)
  void clearMagnitude() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get place => $_getSZ(3);
  @$pb.TagNumber(4)
  set place($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPlace() => $_has(3);
  @$pb.TagNumber(4)
  void clearPlace() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get time => $_getI64(4);
  @$pb.TagNumber(5)
  set time($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get updatedTime => $_getI64(5);
  @$pb.TagNumber(6)
  set updatedTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get timezoneOffset => $_getIZ(6);
  @$pb.TagNumber(7)
  set timezoneOffset($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTimezoneOffset() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimezoneOffset() => clearField(7);

  @$pb.TagNumber(8)
  Alert get alert => $_getN(7);
  @$pb.TagNumber(8)
  set alert(Alert v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasAlert() => $_has(7);
  @$pb.TagNumber(8)
  void clearAlert() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get significance => $_getIZ(8);
  @$pb.TagNumber(9)
  set significance($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasSignificance() => $_has(8);
  @$pb.TagNumber(9)
  void clearSignificance() => clearField(9);

  @$pb.TagNumber(10)
  EarthquakeDetails get details => $_getN(9);
  @$pb.TagNumber(10)
  set details(EarthquakeDetails v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasDetails() => $_has(9);
  @$pb.TagNumber(10)
  void clearDetails() => clearField(10);
  @$pb.TagNumber(10)
  EarthquakeDetails ensureDetails() => $_ensure(9);
}

class EarthquakeDetails extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EarthquakeDetails', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'url')
    ..aOS(3, 'detailFeedUrl')
    ..a<$core.int>(4, 'felt', $pb.PbFieldType.O3)
    ..a<$core.double>(5, 'reportedIntensity', $pb.PbFieldType.OF)
    ..a<$core.double>(6, 'estimatedIntensity', $pb.PbFieldType.OF)
    ..e<Status>(7, 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.STATUS_UNSPECIFIED, valueOf: Status.valueOf, enumValues: Status.values)
    ..aOB(8, 'tsunami')
    ..aOS(9, 'network')
    ..aOS(10, 'code')
    ..aOS(11, 'ids')
    ..aOS(12, 'sources')
    ..aOS(13, 'productTypes')
    ..a<$core.int>(14, 'nst', $pb.PbFieldType.O3)
    ..a<$core.double>(15, 'dmin', $pb.PbFieldType.OF)
    ..a<$core.double>(16, 'rms', $pb.PbFieldType.OF)
    ..a<$core.double>(17, 'gap', $pb.PbFieldType.OF)
    ..aOS(18, 'magType')
    ..e<Type>(19, 'type', $pb.PbFieldType.OE, defaultOrMaker: Type.TYPE_UNSPECIFIED, valueOf: Type.valueOf, enumValues: Type.values)
    ..hasRequiredFields = false
  ;

  EarthquakeDetails._() : super();
  factory EarthquakeDetails() => create();
  factory EarthquakeDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EarthquakeDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EarthquakeDetails clone() => EarthquakeDetails()..mergeFromMessage(this);
  EarthquakeDetails copyWith(void Function(EarthquakeDetails) updates) => super.copyWith((message) => updates(message as EarthquakeDetails));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EarthquakeDetails create() => EarthquakeDetails._();
  EarthquakeDetails createEmptyInstance() => create();
  static $pb.PbList<EarthquakeDetails> createRepeated() => $pb.PbList<EarthquakeDetails>();
  @$core.pragma('dart2js:noInline')
  static EarthquakeDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EarthquakeDetails>(create);
  static EarthquakeDetails _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get detailFeedUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set detailFeedUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDetailFeedUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetailFeedUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get felt => $_getIZ(3);
  @$pb.TagNumber(4)
  set felt($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFelt() => $_has(3);
  @$pb.TagNumber(4)
  void clearFelt() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get reportedIntensity => $_getN(4);
  @$pb.TagNumber(5)
  set reportedIntensity($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReportedIntensity() => $_has(4);
  @$pb.TagNumber(5)
  void clearReportedIntensity() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get estimatedIntensity => $_getN(5);
  @$pb.TagNumber(6)
  set estimatedIntensity($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEstimatedIntensity() => $_has(5);
  @$pb.TagNumber(6)
  void clearEstimatedIntensity() => clearField(6);

  @$pb.TagNumber(7)
  Status get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(Status v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get tsunami => $_getBF(7);
  @$pb.TagNumber(8)
  set tsunami($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTsunami() => $_has(7);
  @$pb.TagNumber(8)
  void clearTsunami() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get network => $_getSZ(8);
  @$pb.TagNumber(9)
  set network($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasNetwork() => $_has(8);
  @$pb.TagNumber(9)
  void clearNetwork() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get code => $_getSZ(9);
  @$pb.TagNumber(10)
  set code($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCode() => $_has(9);
  @$pb.TagNumber(10)
  void clearCode() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get ids => $_getSZ(10);
  @$pb.TagNumber(11)
  set ids($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasIds() => $_has(10);
  @$pb.TagNumber(11)
  void clearIds() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get sources => $_getSZ(11);
  @$pb.TagNumber(12)
  set sources($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSources() => $_has(11);
  @$pb.TagNumber(12)
  void clearSources() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get productTypes => $_getSZ(12);
  @$pb.TagNumber(13)
  set productTypes($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasProductTypes() => $_has(12);
  @$pb.TagNumber(13)
  void clearProductTypes() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get nst => $_getIZ(13);
  @$pb.TagNumber(14)
  set nst($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasNst() => $_has(13);
  @$pb.TagNumber(14)
  void clearNst() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get dmin => $_getN(14);
  @$pb.TagNumber(15)
  set dmin($core.double v) { $_setFloat(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDmin() => $_has(14);
  @$pb.TagNumber(15)
  void clearDmin() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get rms => $_getN(15);
  @$pb.TagNumber(16)
  set rms($core.double v) { $_setFloat(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasRms() => $_has(15);
  @$pb.TagNumber(16)
  void clearRms() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get gap => $_getN(16);
  @$pb.TagNumber(17)
  set gap($core.double v) { $_setFloat(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasGap() => $_has(16);
  @$pb.TagNumber(17)
  void clearGap() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get magType => $_getSZ(17);
  @$pb.TagNumber(18)
  set magType($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasMagType() => $_has(17);
  @$pb.TagNumber(18)
  void clearMagType() => clearField(18);

  @$pb.TagNumber(19)
  Type get type => $_getN(18);
  @$pb.TagNumber(19)
  set type(Type v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasType() => $_has(18);
  @$pb.TagNumber(19)
  void clearType() => clearField(19);
}

class EarthquakeMetadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('EarthquakeMetadata', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aInt64(1, 'generatedTime')
    ..aOS(2, 'url')
    ..aOS(3, 'title')
    ..aOS(4, 'api')
    ..a<$core.int>(5, 'count', $pb.PbFieldType.O3)
    ..aOS(6, 'httpStatus')
    ..hasRequiredFields = false
  ;

  EarthquakeMetadata._() : super();
  factory EarthquakeMetadata() => create();
  factory EarthquakeMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EarthquakeMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  EarthquakeMetadata clone() => EarthquakeMetadata()..mergeFromMessage(this);
  EarthquakeMetadata copyWith(void Function(EarthquakeMetadata) updates) => super.copyWith((message) => updates(message as EarthquakeMetadata));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static EarthquakeMetadata create() => EarthquakeMetadata._();
  EarthquakeMetadata createEmptyInstance() => create();
  static $pb.PbList<EarthquakeMetadata> createRepeated() => $pb.PbList<EarthquakeMetadata>();
  @$core.pragma('dart2js:noInline')
  static EarthquakeMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EarthquakeMetadata>(create);
  static EarthquakeMetadata _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get generatedTime => $_getI64(0);
  @$pb.TagNumber(1)
  set generatedTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeneratedTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeneratedTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get api => $_getSZ(3);
  @$pb.TagNumber(4)
  set api($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasApi() => $_has(3);
  @$pb.TagNumber(4)
  void clearApi() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get count => $_getIZ(4);
  @$pb.TagNumber(5)
  set count($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get httpStatus => $_getSZ(5);
  @$pb.TagNumber(6)
  set httpStatus($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHttpStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearHttpStatus() => clearField(6);
}

class GeoBoundsE7 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeoBoundsE7', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, 'minLatitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, 'minLongitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, 'minHeight', $pb.PbFieldType.OS3)
    ..a<$core.int>(4, 'maxLatitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(5, 'maxLongitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(6, 'maxHeight', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  GeoBoundsE7._() : super();
  factory GeoBoundsE7() => create();
  factory GeoBoundsE7.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoBoundsE7.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeoBoundsE7 clone() => GeoBoundsE7()..mergeFromMessage(this);
  GeoBoundsE7 copyWith(void Function(GeoBoundsE7) updates) => super.copyWith((message) => updates(message as GeoBoundsE7));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoBoundsE7 create() => GeoBoundsE7._();
  GeoBoundsE7 createEmptyInstance() => create();
  static $pb.PbList<GeoBoundsE7> createRepeated() => $pb.PbList<GeoBoundsE7>();
  @$core.pragma('dart2js:noInline')
  static GeoBoundsE7 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoBoundsE7>(create);
  static GeoBoundsE7 _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minLatitude => $_getIZ(0);
  @$pb.TagNumber(1)
  set minLatitude($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minLongitude => $_getIZ(1);
  @$pb.TagNumber(2)
  set minLongitude($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinLongitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get minHeight => $_getIZ(2);
  @$pb.TagNumber(3)
  set minHeight($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMinHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinHeight() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get maxLatitude => $_getIZ(3);
  @$pb.TagNumber(4)
  set maxLatitude($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMaxLatitude() => $_has(3);
  @$pb.TagNumber(4)
  void clearMaxLatitude() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxLongitude => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxLongitude($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxLongitude() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxLongitude() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get maxHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set maxHeight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxHeight() => clearField(6);
}

class GeoPointE7 extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GeoPointE7', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, 'latitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(2, 'longitude', $pb.PbFieldType.OSF3)
    ..a<$core.int>(3, 'height', $pb.PbFieldType.OS3)
    ..hasRequiredFields = false
  ;

  GeoPointE7._() : super();
  factory GeoPointE7() => create();
  factory GeoPointE7.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GeoPointE7.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GeoPointE7 clone() => GeoPointE7()..mergeFromMessage(this);
  GeoPointE7 copyWith(void Function(GeoPointE7) updates) => super.copyWith((message) => updates(message as GeoPointE7));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GeoPointE7 create() => GeoPointE7._();
  GeoPointE7 createEmptyInstance() => create();
  static $pb.PbList<GeoPointE7> createRepeated() => $pb.PbList<GeoPointE7>();
  @$core.pragma('dart2js:noInline')
  static GeoPointE7 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GeoPointE7>(create);
  static GeoPointE7 _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get latitude => $_getIZ(0);
  @$pb.TagNumber(1)
  set latitude($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get longitude => $_getIZ(1);
  @$pb.TagNumber(2)
  set longitude($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLongitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLongitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);
}

