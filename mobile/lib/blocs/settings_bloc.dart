// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// SettingsBloc handle changes on settings (ie. unit system).
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:core/models.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UnitSystemToggled extends SettingsEvent {
}

class LimitChanged extends SettingsEvent {
  final int limit;

  LimitChanged({@required this.limit}) : assert(limit != null);

  @override
  List<Object> get props => [limit];
}

class SettingsState extends Equatable {
  final UnitSystem unitSystem;
  final int limit;

  const SettingsState({@required this.unitSystem, @required this.limit})
      : assert(unitSystem != null && limit != null);

  @override
  List<Object> get props => [unitSystem, limit];
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  @override
  SettingsState get initialState =>
      SettingsState(unitSystem: UnitSystem.metric, limit: 20);

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is UnitSystemToggled) {
      yield SettingsState(
        limit: state.limit,
        unitSystem: state.unitSystem == UnitSystem.metric
            ? UnitSystem.imperial
            : UnitSystem.metric,
      );
    }
    else if(event is LimitChanged) {
      yield SettingsState(
        limit: event.limit,
        unitSystem: state.unitSystem
      ); 
    }
  }
}
