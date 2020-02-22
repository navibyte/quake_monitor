// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

import 'package:meta/meta.dart';

import 'package:grpc/grpc.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

import 'package:api/api.dart';

// EarthquakeApiClient is a helper class to access the gRPC service
// for earthquakes. Use open() to open a channel, call methods for
// the returned channel and remember to shutdown() the channel after use.
class EarthquakeApiClient {
  final String address;
  final int port;
  final bool isSecure;

  const EarthquakeApiClient(
      {@required this.address, @required this.port, @required this.isSecure})
      : assert(address != null && port != null && isSecure != null);

  Future<EarthquakeChannel> open() async {
    if (isSecure) {
      // secure (SSL / TLS) connection
      return EarthquakeChannel(ClientChannel(address,
          port: port,
          options: const ChannelOptions(
              connectionTimeout: Duration(seconds: 30),
              credentials: ChannelCredentials.secure())));
    } else {
      // insecure connection
      return EarthquakeChannel(ClientChannel(address,
          port: port,
          options: const ChannelOptions(
              connectionTimeout: Duration(seconds: 30),
              credentials: ChannelCredentials.insecure())));
    }
  }
}

// EarthquakeChannel provides an open connection to gRPC service
// for earthquakes. After use remember to shutdown().
class EarthquakeChannel {
  ClientChannel _channel;
  QuakeServiceClient _stub;

  EarthquakeChannel(ClientChannel channel) {
    _channel = channel;
    _stub = QuakeServiceClient(_channel);
  }

  Future<void> shutdown() async {
    return _channel.shutdown();
  }

  // Get earthquake by id.
  Future<Earthquake> getEarthquake(String id) async {
    // handle request params
    if (id == null) throw 'Id must be non-null';
    final req = GetEarthquakeRequest()..id = id;

    // call the service and return Earthquake
    final res = await _stub.getEarthquake(req).catchError((e) => throw e);
    return res.feature;
  }

  // List earthquakes.
  Future<EarthquakeCollection> listEarthquakes(
      {Magnitude magnitude,
      Past past,
      int limit,
      bool details,
      GeoPointE7 position,
      GeoBoundsE7 bounds}) async {
    // handle request params (if no args given, request all M45+
    // earthquakes for past day without details)
    final req = ListEarthquakesRequest()
      ..magnitude = magnitude ?? Magnitude.MAGNITUDE_M45_PLUS
      ..past = past ?? Past.PAST_DAY
      ..limit = $fixnum.Int64(limit >= 0 ? limit : 0)
      ..details = details ?? false;
    if (position != null) req.position = position;
    if (bounds != null) req.bounds = bounds;

    // call the service and return EarthquakeCollection
    final res = await _stub.listEarthquakes(req);
    return res.collection;
  }
}
