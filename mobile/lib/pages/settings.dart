// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Settings page for changing app settings (ie. unit system).
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'dart:math' as $math;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/models.dart';

import '../blocs/blocs.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          double limit = state.limit.toDouble();
          return ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Unit System',
                ),
                isThreeLine: true,
                subtitle: Text('Use metric units for measurements.'),
                trailing: Switch(
                  value: state.unitSystem == UnitSystem.metric,
                  onChanged: (_) => BlocProvider.of<SettingsBloc>(context)
                      .add(UnitSystemToggled()),
                ),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Limit results',
                    ),
                    isThreeLine: true,
                    subtitle: Text('Max number of earthquakes on lists.'),
                    trailing: Container(
                        padding: EdgeInsets.only(right: 16),
                        child: Text(
                          '${limit.round()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Slider(
                    value: limit,
                    min: $math.min(10, limit),
                    max: $math.max(100, limit),
                    onChanged: (newValue) =>
                        BlocProvider.of<SettingsBloc>(context)
                            .add(LimitChanged(limit: newValue.round())),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
