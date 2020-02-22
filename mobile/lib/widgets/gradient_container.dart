// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// GradientContainer colors the background respect to current app theming.
//
// Adapted from the MIT-licensed Flutter Weather sample app of Bloc-library:
// https://github.com/felangel/bloc/tree/master/examples/flutter_weather

import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final MaterialColor color;

  const GradientContainer({
    Key key,
    @required this.color,
    @required this.child,
  })  : assert(color != null, child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.6, 0.8, 1.0],
          colors: [
            color[200],
            color[100],
            Color(0xfff8f8f8), //color[50],
            /*color[700],
            color[500],
            color[300],*/
          ],
        ),
      ),
      child: child,
    );
  }
}
