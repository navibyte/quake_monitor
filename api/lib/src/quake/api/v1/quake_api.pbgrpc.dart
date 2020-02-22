///
//  Generated code. Do not modify.
//  source: quake/api/v1/quake_api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'quake_api.pb.dart' as $0;
export 'quake_api.pb.dart';

class QuakeServiceClient extends $grpc.Client {
  static final _$listEarthquakes =
      $grpc.ClientMethod<$0.ListEarthquakesRequest, $0.ListEarthquakesResponse>(
          '/quake.api.v1.QuakeService/ListEarthquakes',
          ($0.ListEarthquakesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListEarthquakesResponse.fromBuffer(value));
  static final _$getEarthquake =
      $grpc.ClientMethod<$0.GetEarthquakeRequest, $0.GetEarthquakeResponse>(
          '/quake.api.v1.QuakeService/GetEarthquake',
          ($0.GetEarthquakeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetEarthquakeResponse.fromBuffer(value));

  QuakeServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.ListEarthquakesResponse> listEarthquakes(
      $0.ListEarthquakesRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$listEarthquakes, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetEarthquakeResponse> getEarthquake(
      $0.GetEarthquakeRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getEarthquake, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class QuakeServiceBase extends $grpc.Service {
  $core.String get $name => 'quake.api.v1.QuakeService';

  QuakeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListEarthquakesRequest,
            $0.ListEarthquakesResponse>(
        'ListEarthquakes',
        listEarthquakes_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ListEarthquakesRequest.fromBuffer(value),
        ($0.ListEarthquakesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetEarthquakeRequest, $0.GetEarthquakeResponse>(
            'GetEarthquake',
            getEarthquake_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetEarthquakeRequest.fromBuffer(value),
            ($0.GetEarthquakeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListEarthquakesResponse> listEarthquakes_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ListEarthquakesRequest> request) async {
    return listEarthquakes(call, await request);
  }

  $async.Future<$0.GetEarthquakeResponse> getEarthquake_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetEarthquakeRequest> request) async {
    return getEarthquake(call, await request);
  }

  $async.Future<$0.ListEarthquakesResponse> listEarthquakes(
      $grpc.ServiceCall call, $0.ListEarthquakesRequest request);
  $async.Future<$0.GetEarthquakeResponse> getEarthquake(
      $grpc.ServiceCall call, $0.GetEarthquakeRequest request);
}
