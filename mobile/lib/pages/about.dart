// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Function showing about dialog.

import 'package:flutter/material.dart';

Future<void> showAppAboutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text('Quake Monitor v0.1 BETA')),
        content: SingleChildScrollView(
          child: ListBody(
            
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 12, 18),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 96,
                  height: 96,
                  child: Material(
                    elevation: 30.0,
                    child: Image.asset(
                        'assets/apps-logo-256x256-true-color.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Center(child: Text('Quake Monitor')),
              Text(''),
              Text('The app is experimental beta version. Based on the web' + 
              ' support of the Flutter framework. Tested on Chrome.'),
              Text(''),
              Text('Using also packages equatable, flutter_bloc and circular_bottom_navigation' + 
                  ' (licenses and other info: https://pub.dev/packages).'),
              Text(''),
              Text('Data sources: earthquakes from the GeoJSON service of the USGS' +
              ' and place searches from GeoNames.org.'),
              Text(''),
              Text('App bar images: by Marcello Migliosi (via Pixabay).'),
            ],
          ),
        ),

        actions: <Widget>[
          FlatButton(
            child: Text('Continue'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
