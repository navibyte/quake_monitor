// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Quake Monitor - main() and the app widget
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/providers.dart';
import 'package:core/repositories.dart';

import 'blocs/blocs.dart';
import 'pages/pages.dart';
import 'utils/utils.dart';

import 'conf.dart';

// BlocDelegate to track (print out) state transitions
class SimpleBlocDelegate extends BlocDelegate {
  
  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //debugPrint(bloc.runtimeType.toString() + ' : ' + transition.toString());
  }
}

void main() {
  // IMPORTANT : see conf.dart for repository configuration

  // Create earthquake repository (using gRPC based provider for iOS and Android,
  // and RESTful / GeoJSON provider for Web)
  final useGRPC = !checkIsWeb() && QUAKE_SERVICE_ADDRESS.isNotEmpty;
  final repository = EarthquakeRepository(
      earthquakeProvider: useGRPC
          ? EarthquakeProviderGRPC(
              address: QUAKE_SERVICE_ADDRESS,
              port: QUAKE_SERVICE_PORT,
              isSecure: QUAKE_SERVICE_IS_SECURE)
          : EarthquakeProviderGeoJSON(httpClient: http.Client()),
      locationProvider: LocationProviderGeoNames(
        username: GEONAMES_USERNAME,
      ));

  // setup blog delegate
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // run the app with SettingsBloc state provider initialized
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: App(earthquakeRepository: repository),
    ),
  );
}

class App extends StatelessWidget {
  final EarthquakeRepository earthquakeRepository;

  App({Key key, @required this.earthquakeRepository})
      : assert(earthquakeRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quake Monitor',
      home: MultiBlocProvider(
        // create earthquake bloc providers for three different flavors
        providers: [
          BlocProvider<SignificantEarthquakesBloc>(
            create: (context) =>
                SignificantEarthquakesBloc(repository: earthquakeRepository),
          ),
          BlocProvider<LatestEarthquakesBloc>(
            create: (context) =>
                LatestEarthquakesBloc(repository: earthquakeRepository),
          ),
          BlocProvider<NearbyEarthquakesBloc>(
            create: (context) =>
                NearbyEarthquakesBloc(repository: earthquakeRepository),
          ),
        ],

        // Wrapper is the main page with tree tab views (each one representing 
        // earthquake lists for bloc providers initialized just above).
        child: Wrapper(),
      ),
    );
  }
}
