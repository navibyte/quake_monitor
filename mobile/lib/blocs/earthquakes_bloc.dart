// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Earthquakes BLoC with three flavors to access earthquakes:
// - significant (major earthquakes for past 7 days)
// - latest (latest earthquakes for past day)
// - nearby (earthquakes near a location for past 7 days)
//
// These flavors also match with data access methods of EarthquakeRepository.
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:core/models.dart';
import 'package:core/repositories.dart';

enum GetAction { fetch, refresh }
enum GetFlavor { significant, latest, nearby }

abstract class EarthquakesEvent extends Equatable {
  const EarthquakesEvent();
}

class GetEarthquakes extends EarthquakesEvent {
  final GetAction action;
  final GetFlavor flavor;
  final String place;
  final int limit;

  const GetEarthquakes(
      {@required this.action,
      @required this.flavor,
      this.place,
      this.limit = 20})
      : assert(action != null && flavor != null);

  @override
  List<Object> get props => [action, flavor, place, limit];
}

abstract class EarthquakesState extends Equatable {
  const EarthquakesState();

  @override
  List<Object> get props => [];
}

class EarthquakesEmpty extends EarthquakesState {}

class EarthquakesLoading extends EarthquakesState {}

class EarthquakesLoaded extends EarthquakesState {
  final String place;
  final Alert alert;

  // list of Strings (for headers) or Earthquakes (for cards)
  final List items;

  const EarthquakesLoaded(
      {this.place, @required this.alert, @required this.items})
      : assert(alert != null && items != null);

  @override
  List<Object> get props => [place, alert, items];
}

class EarthquakesError extends EarthquakesState {
  final String errorText;

  const EarthquakesError({@required this.errorText})
      : assert(errorText != null);
}

class EarthquakesBloc extends Bloc<EarthquakesEvent, EarthquakesState> {
  final EarthquakeRepository repository;

  EarthquakesBloc({@required this.repository}) : assert(repository != null);

  @override
  EarthquakesState get initialState => EarthquakesEmpty();

  @override
  Stream<EarthquakesState> mapEventToState(EarthquakesEvent event) async* {
    if (event is GetEarthquakes) {
      if (event.action == GetAction.fetch) {
        yield EarthquakesLoading();
      }
      try {
        List<Earthquake> earthquakes;
        switch (event.flavor) {
          case GetFlavor.significant:
            earthquakes = await repository.getSignificant(event.limit);
            break;
          case GetFlavor.latest:
            earthquakes = await repository.getLatest(event.limit);
            break;
          case GetFlavor.nearby:
            if (event.place == null) throw "No place given";
            earthquakes = await repository.getNear(event.place, event.limit);
            break;
        }
        List items = [
          if (event.place != null) '${event.place}', // use place name as a header
          if (event.flavor == GetFlavor.significant) 'Alerts past 30 days',
          if (event.flavor == GetFlavor.latest) 'Past hour',
        ];
        items.addAll(earthquakes);
        yield EarthquakesLoaded(
            place: event.place, alert: Alert.unspecified, items: items);
      } catch (e, s) {
        print('$e');
        //print('Stack trace:\n $s');

        yield event.action == GetAction.fetch
            ? EarthquakesError(errorText: _checkErrorText(e.toString()))
            : state;
      }
    }
  }

  String _checkErrorText(String text) {
    if (text.startsWith('Exception: ') && text.length > 11) return text.substring(11);
    return text;
  }
}

// -----------------------------------------------------------------------------
// Named versions of the EarthquakesBloc for each flavor.

class SignificantEarthquakesBloc extends EarthquakesBloc {
  SignificantEarthquakesBloc({@required EarthquakeRepository repository})
      : super(repository: repository);
}

class LatestEarthquakesBloc extends EarthquakesBloc {
  LatestEarthquakesBloc({@required EarthquakeRepository repository})
      : super(repository: repository);
}

class NearbyEarthquakesBloc extends EarthquakesBloc {
  NearbyEarthquakesBloc({@required EarthquakeRepository repository})
      : super(repository: repository);
}
