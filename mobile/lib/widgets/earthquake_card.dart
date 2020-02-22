// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

import 'dart:ui';

import 'package:flutter/material.dart' hide Image;

import 'package:core/models.dart';
import 'package:core/utils.dart';
import 'package:core/i18n.dart';

import 'earthquake_map.dart';

// A card showing basic information of an earthquake. It has also an extended
// mode when a world map is shown below this basic information. The map is
// implemented by EarthquakeMap class.
class EarthquakeCard extends StatefulWidget {
  final Image bgMapImage; // Image of dart:ui package
  final Image mapSymbolImage;

  final Earthquake earthquake;
  final UnitSystem units;
  final Color color;

  EarthquakeCard(
      {Key key,
      this.bgMapImage,
      this.mapSymbolImage,
      @required this.earthquake,
      this.units = UnitSystem.metric,
      this.color = Colors.orange})
      : assert(earthquake != null),
        super(key: key);

  State<EarthquakeCard> createState() => _EarthquakeCardState();
}

class _EarthquakeCardState extends State<EarthquakeCard> {
  bool _extended;

  @override
  void initState() {
    super.initState();

    _extended = false;
  }

  @override
  Widget build(BuildContext context) {
    final eq = widget.earthquake;
    return Card(
        key: Key(eq.id),
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(children: [
          ListTile(
            leading: LayoutBuilder(builder: (context, constraint) {
              return Icon(Icons.wifi_tethering,
                  color: widget.color,
                  // size icon according to room available and earthquake magnitude
                  size: (2.0 + eq.magnitude / 4.0) /
                      4.0 *
                      constraint.biggest.height);
            }),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  _extended = !_extended;
                });
              },
              child: Icon(_extended ? Icons.expand_less : Icons.expand_more),
            ),
            title: Text(
                '${formatMagnitude(eq.magnitude)}  -  ${formatLocalDateFromUTC(eq.time)}'),
            subtitle: Text('${formatPlaceText(eq.place, units: widget.units)}'),
            isThreeLine: false,
          ),
          Visibility(
              key: Key('vis-' + eq.id),
              visible: _extended,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Depth: ${formatDistance(-eq.position.height, units: widget.units)}'),
                          Text(
                              "Updated: ${formatTimeAgoFromUTC(eq.updatedTime)}"),
                        ],
                      ),
                      if (eq.distance != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                'Distance: ${formatDistance(eq.distance, units: widget.units)}'),
                          ],
                        ),
                    ]),
                  ),
                  EarthquakeMap(
                      key: Key('map-' + eq.id),
                      bgMapImage: widget.bgMapImage,
                      mapSymbolImage: widget.mapSymbolImage,
                      earthquake: eq),
                ],
              ))
        ]));
  }
}
