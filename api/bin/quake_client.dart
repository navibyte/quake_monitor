// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

import 'dart:async';
import 'dart:io';

import 'package:fixnum/fixnum.dart' as $fixnum;

import 'package:api/api.dart';

// The main() entry for this "quake_client" test CLI tool.
Future<void> main(List<String> args) async {
  // print usage if no args or asked for help
  if (args.isEmpty) {
    _printUsage();
    exit(1);
  } else if (args[0].toLowerCase() == 'help') {
    _printUsage();
    exit(0);
  }

  // switch by a command given on args
  try {
    switch (args[0]) {
      case "GetEarthquake":
        await _getEarthquake(args);
        break;
      case "ListEarthquakes":
        await _listEarthquakes(args);
        break;
      default:
        print("Unknown method: ${args[0]}");
        exit(1);
    }
  } catch (e) {
    print('Failed to call: $e');
    exit(1);
  }
}

// Initialize a gRPC client, open a channel and call GetEarthquake RPC-method.
void _getEarthquake(List<String> args) async {
  // setup API client and open a channel to gRPC service
  final client = _createAPIClient();
  final channel = await client.open();
  try {
    // call gRPC service
    final id = args.length >= 2 ? args[1] : 'us70006uy7';
    final eq = await channel.getEarthquake(id);
    if (eq != null) {
      // got an earthquake - print it on the console
      _printEarthquake(eq);
    }
  } finally {
    // ensure resources are closed 
    await channel.shutdown();
  }
}

// Initialize a gRPC client, open a channel and call ListEarthquakes RPC-method.
void _listEarthquakes(List<String> args) async {
  // setup API client and open a channel to gRPC service
  final client = _createAPIClient();
  final channel = await client.open();
  try {
    // call gRPC service
    final req = parseListEarthquakesRequest(args);
    final col = await channel.listEarthquakes(
        magnitude: req.magnitude,
        past: req.past,
        limit: req.limit.toInt(),
        details: req.details);

    if (col != null) {
      // got a collection of earthquakes - print em' on the console
      for (Earthquake eq in col.features) {
        _printEarthquake(eq);
      }
    }
  } finally {
    // ensure resources are closed 
    await channel.shutdown();
  }
}

// Create a API client for the gRPC service.
EarthquakeApiClient _createAPIClient() {
  final service = Platform.environment["QUAKE_SERVICE"];
  if (service != null) {
    // by default use service env as address (and port is 443 for https)
    String address = service;
    int port = 443;
    // if env is like "myserver.example.org:8080" then parse address and port
    if (address.contains(":")) {
      List<String> parts = address.split(":");
      if (parts.length >= 2) {
        address = parts[0];
        port = int.parse(parts[1]);
      }
    }
    print(port == 443
        ? 'Using secure gRPC-server: ${service}:${port}'
        : 'Using insecure gRPC-server: ${service}:${port}');
    return EarthquakeApiClient(
        address: address, port: port, isSecure: port == 443);
  }

  // no env set for QuakeService so use default "localhost:50051"
  print('Using insecure gRPC-server: localhost:50051');
  return EarthquakeApiClient(
      address: "localhost", port: 50051, isSecure: false);
}

// Prints only basic properties of an earthquake.
void _printEarthquake(Earthquake eq) {
  final ts =
      DateTime.fromMillisecondsSinceEpoch(eq.time.toInt() * 1000, isUtc: true);
  print(
      'Earthquake: ${eq.id} ${ts} ${(eq.magnitude).toStringAsFixed(1)} ${eq.place}');
}

// Prints the usage help for this CLI command.
void _printUsage() {
  print("Usage: quake-client <method> <params>..");
  print("Methods:");
  print("  help");
  print("  GetEarthquake <id>");
  print("     id: {string}");
  print("  ListEarthquakes <magnitude> <past> <limit> <details>");
  print("     magnitude: significant | 4.5 | 2.5 | 1.0 | all");
  print("     past: hour | day | 7days | 30days");
  print("     limit: {integer}");
  print("     details: true | false");
  print("Optionally use env QUAKE_SERVICE to set server as 'address:port'.");
  print("Otherwise a default address is used: 'localhost:50051'");
}

// Parses args of the CLI call for the ListEarthquakes RPC-method.
ListEarthquakesRequest parseListEarthquakesRequest(List<String> args) {
  final req = ListEarthquakesRequest()
    ..magnitude = Magnitude.MAGNITUDE_M45_PLUS
    ..past = Past.PAST_DAY;

  if (args.length >= 2) {
    switch (args[1]) {
      case "significant":
        req.magnitude = Magnitude.MAGNITUDE_SIGNIFICANT;
        break;
      case "4.5":
        req.magnitude = Magnitude.MAGNITUDE_M45_PLUS;
        break;
      case "2.5":
        req.magnitude = Magnitude.MAGNITUDE_M25_PLUS;
        break;
      case "1.0":
        req.magnitude = Magnitude.MAGNITUDE_M10_PLUS;
        break;
      case "all":
        req.magnitude = Magnitude.MAGNITUDE_ALL;
        break;
      default:
        throw Exception("unknown magnitude: " + args[1]);
    }
  }

  if (args.length >= 3) {
    switch (args[2]) {
      case "hour":
        req.past = Past.PAST_HOUR;
        break;
      case "day":
        req.past = Past.PAST_DAY;
        break;
      case "7days":
        req.past = Past.PAST_7DAYS;
        break;
      case "30days":
        req.past = Past.PAST_30DAYS;
        break;
      default:
        throw Exception("unknown past: " + args[2]);
    }
  }

  if (args.length >= 4) {
    req.limit = $fixnum.Int64(int.parse(args[3]));
  }

  if (args.length >= 5) {
    switch (args[4]) {
      case "true":
        req.details = true;
        break;
      case "false":
        req.details = false;
        break;
      default:
        throw Exception("unknown details: " + args[4]);
    }
  }

  return req;
}

