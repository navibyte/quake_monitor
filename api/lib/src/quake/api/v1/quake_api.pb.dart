///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake_api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'quake.pb.dart' as $1;

import 'quake_api.pbenum.dart';

export 'quake_api.pbenum.dart';

enum ListEarthquakesRequest_Focus {
  position, 
  bounds, 
  notSet
}

class ListEarthquakesRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ListEarthquakesRequest_Focus> _ListEarthquakesRequest_FocusByTag = {
    5 : ListEarthquakesRequest_Focus.position,
    6 : ListEarthquakesRequest_Focus.bounds,
    0 : ListEarthquakesRequest_Focus.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListEarthquakesRequest', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..oo(0, [5, 6])
    ..e<Magnitude>(1, 'magnitude', $pb.PbFieldType.OE, defaultOrMaker: Magnitude.MAGNITUDE_UNSPECIFIED, valueOf: Magnitude.valueOf, enumValues: Magnitude.values)
    ..e<Past>(2, 'past', $pb.PbFieldType.OE, defaultOrMaker: Past.PAST_UNSPECIFIED, valueOf: Past.valueOf, enumValues: Past.values)
    ..a<$fixnum.Int64>(3, 'limit', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, 'details')
    ..aOM<$1.GeoPointE7>(5, 'position', subBuilder: $1.GeoPointE7.create)
    ..aOM<$1.GeoBoundsE7>(6, 'bounds', subBuilder: $1.GeoBoundsE7.create)
    ..hasRequiredFields = false
  ;

  ListEarthquakesRequest._() : super();
  factory ListEarthquakesRequest() => create();
  factory ListEarthquakesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEarthquakesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListEarthquakesRequest clone() => ListEarthquakesRequest()..mergeFromMessage(this);
  ListEarthquakesRequest copyWith(void Function(ListEarthquakesRequest) updates) => super.copyWith((message) => updates(message as ListEarthquakesRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListEarthquakesRequest create() => ListEarthquakesRequest._();
  ListEarthquakesRequest createEmptyInstance() => create();
  static $pb.PbList<ListEarthquakesRequest> createRepeated() => $pb.PbList<ListEarthquakesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListEarthquakesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEarthquakesRequest>(create);
  static ListEarthquakesRequest _defaultInstance;

  ListEarthquakesRequest_Focus whichFocus() => _ListEarthquakesRequest_FocusByTag[$_whichOneof(0)];
  void clearFocus() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Magnitude get magnitude => $_getN(0);
  @$pb.TagNumber(1)
  set magnitude(Magnitude v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMagnitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearMagnitude() => clearField(1);

  @$pb.TagNumber(2)
  Past get past => $_getN(1);
  @$pb.TagNumber(2)
  set past(Past v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPast() => $_has(1);
  @$pb.TagNumber(2)
  void clearPast() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get limit => $_getI64(2);
  @$pb.TagNumber(3)
  set limit($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLimit() => $_has(2);
  @$pb.TagNumber(3)
  void clearLimit() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get details => $_getBF(3);
  @$pb.TagNumber(4)
  set details($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDetails() => $_has(3);
  @$pb.TagNumber(4)
  void clearDetails() => clearField(4);

  @$pb.TagNumber(5)
  $1.GeoPointE7 get position => $_getN(4);
  @$pb.TagNumber(5)
  set position($1.GeoPointE7 v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPosition() => $_has(4);
  @$pb.TagNumber(5)
  void clearPosition() => clearField(5);
  @$pb.TagNumber(5)
  $1.GeoPointE7 ensurePosition() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.GeoBoundsE7 get bounds => $_getN(5);
  @$pb.TagNumber(6)
  set bounds($1.GeoBoundsE7 v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBounds() => $_has(5);
  @$pb.TagNumber(6)
  void clearBounds() => clearField(6);
  @$pb.TagNumber(6)
  $1.GeoBoundsE7 ensureBounds() => $_ensure(5);
}

class ListEarthquakesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ListEarthquakesResponse', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOM<$1.EarthquakeCollection>(1, 'collection', subBuilder: $1.EarthquakeCollection.create)
    ..hasRequiredFields = false
  ;

  ListEarthquakesResponse._() : super();
  factory ListEarthquakesResponse() => create();
  factory ListEarthquakesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListEarthquakesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ListEarthquakesResponse clone() => ListEarthquakesResponse()..mergeFromMessage(this);
  ListEarthquakesResponse copyWith(void Function(ListEarthquakesResponse) updates) => super.copyWith((message) => updates(message as ListEarthquakesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListEarthquakesResponse create() => ListEarthquakesResponse._();
  ListEarthquakesResponse createEmptyInstance() => create();
  static $pb.PbList<ListEarthquakesResponse> createRepeated() => $pb.PbList<ListEarthquakesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListEarthquakesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListEarthquakesResponse>(create);
  static ListEarthquakesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $1.EarthquakeCollection get collection => $_getN(0);
  @$pb.TagNumber(1)
  set collection($1.EarthquakeCollection v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCollection() => $_has(0);
  @$pb.TagNumber(1)
  void clearCollection() => clearField(1);
  @$pb.TagNumber(1)
  $1.EarthquakeCollection ensureCollection() => $_ensure(0);
}

class GetEarthquakeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEarthquakeRequest', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOB(2, 'details')
    ..hasRequiredFields = false
  ;

  GetEarthquakeRequest._() : super();
  factory GetEarthquakeRequest() => create();
  factory GetEarthquakeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEarthquakeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEarthquakeRequest clone() => GetEarthquakeRequest()..mergeFromMessage(this);
  GetEarthquakeRequest copyWith(void Function(GetEarthquakeRequest) updates) => super.copyWith((message) => updates(message as GetEarthquakeRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEarthquakeRequest create() => GetEarthquakeRequest._();
  GetEarthquakeRequest createEmptyInstance() => create();
  static $pb.PbList<GetEarthquakeRequest> createRepeated() => $pb.PbList<GetEarthquakeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetEarthquakeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEarthquakeRequest>(create);
  static GetEarthquakeRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get details => $_getBF(1);
  @$pb.TagNumber(2)
  set details($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetails() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetails() => clearField(2);
}

class GetEarthquakeResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetEarthquakeResponse', package: const $pb.PackageName('quake.api.v1'), createEmptyInstance: create)
    ..aOM<$1.Earthquake>(1, 'feature', subBuilder: $1.Earthquake.create)
    ..hasRequiredFields = false
  ;

  GetEarthquakeResponse._() : super();
  factory GetEarthquakeResponse() => create();
  factory GetEarthquakeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetEarthquakeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetEarthquakeResponse clone() => GetEarthquakeResponse()..mergeFromMessage(this);
  GetEarthquakeResponse copyWith(void Function(GetEarthquakeResponse) updates) => super.copyWith((message) => updates(message as GetEarthquakeResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetEarthquakeResponse create() => GetEarthquakeResponse._();
  GetEarthquakeResponse createEmptyInstance() => create();
  static $pb.PbList<GetEarthquakeResponse> createRepeated() => $pb.PbList<GetEarthquakeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetEarthquakeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetEarthquakeResponse>(create);
  static GetEarthquakeResponse _defaultInstance;

  @$pb.TagNumber(1)
  $1.Earthquake get feature => $_getN(0);
  @$pb.TagNumber(1)
  set feature($1.Earthquake v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeature() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeature() => clearField(1);
  @$pb.TagNumber(1)
  $1.Earthquake ensureFeature() => $_ensure(0);
}

