// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Map widget to show an earthquake on a small scale overview earth map.

import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart' hide Image;

import 'package:core/models.dart';

import '../utils/utils.dart';

// EartquakeMap is a stateful widget for drawing a location of an earthquake
// on a world map. The world map has animated zooming (and zoom can be changed
// by clicks) but this map widget does not have any other mapping functions.
class EarthquakeMap extends StatefulWidget {
  final Image bgMapImage; // Image of dart:ui package
  final Image mapSymbolImage;

  final Earthquake earthquake;
  final double zoomMin;
  final double zoomMax;

  EarthquakeMap(
      {Key key,
      this.bgMapImage,
      this.mapSymbolImage,
      @required this.earthquake,
      this.zoomMin = 2.0,
      this.zoomMax = 8.0})
      : assert(earthquake != null),
        super(key: key);

  State<EarthquakeMap> createState() => _EarthquakeMapState();
}

class _EarthquakeMapState extends State<EarthquakeMap>
    with SingleTickerProviderStateMixin {
  AnimationController _zoomInController;
  Animation _zoomIn;
  double _zoom;

  @override
  void initState() {
    super.initState();

    // initial zoom
    _zoom = widget.zoomMin;

    // zoom in animation
    _zoomInController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _zoomIn = Tween(begin: widget.zoomMin, end: widget.zoomMax)
        .animate(_zoomInController);
    _zoomInController.forward();
    _zoomIn.addListener(() {
      setState(() {
        _zoom = _zoomIn.value;
      });
    });
  }

  @override
  void dispose() {
    _zoomInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (_zoomInController.isAnimating) {
            _zoomInController.stop(canceled: true);
          }
          setState(() {
            final delta = widget.zoomMax - widget.zoomMin;
            final z = (_zoom - widget.zoomMin) / delta;
            if (z > 0.95)
              _zoom = widget.zoomMin;
            else
              _zoom = min(widget.zoomMax, _zoom + delta / 3.0);
          });
        },
        child: CustomPaint(
          painter: MapPainter(widget.bgMapImage, widget.mapSymbolImage,
              widget.earthquake, _zoom),
          child: AspectRatio(aspectRatio: 2.0),
        ));
  }
}

// Custom painter for the world map.
class MapPainter extends CustomPainter {
  final Image bgMapImage;
  final Image mapSymbolImage;
  final Earthquake earthquake;
  final double zoom;

  MapPainter(this.bgMapImage, this.mapSymbolImage, this.earthquake, this.zoom);

  @override
  void paint(Canvas canvas, Size size) {
    //print('size ${size.width} ${size.height}');

    // without background image there's nothing to paint..
    if (bgMapImage == null) return;

    // image sizes
    final imageWidth = bgMapImage.width;
    final imageHeight = bgMapImage.height;

    // calculate position of an earthquake on image coordinate space
    final lat = earthquake.position.latitude; // of range [-90.0, 90.0]
    final lon = earthquake.position.longitude; // of range [-180.0, 180.0]
    final leftOnImage = (lon + 180.0) / 360.0 * imageWidth;
    final topOnImage = imageHeight - (lat + 90.0) / 180.0 * imageHeight;

    // calculate zoomed rect
    final rectWidth = imageWidth / zoom;
    final rectHeight = imageHeight / zoom;
    final rectLeft = leftOnImage - rectWidth / 2.0;
    double rectTop = topOnImage - rectHeight / 2.0;

    // position of earthquake in canvas coordinates
    double leftOnCanvas = size.width / 2.0;
    double topOnCanvas = size.height / 2.0;

    if (zoom > 1.0) {
      if (rectTop < 0) {
        // near the north pole, fix top of canvas to top of image
        rectTop = 0.0;
        final bottomLat = 90.0 - 180.0 * (rectHeight / imageHeight);
        topOnCanvas = (90.0 - lat) / (90.0 - bottomLat) * size.height;
      } else if (rectTop + rectHeight > imageHeight) {
        // near the south pole, fix bottom of canvas to bottom of image
        rectTop = imageHeight - rectHeight;
        final topLat = -90.0 + 180.0 * (rectHeight / imageHeight);
        topOnCanvas =
            size.height - (lat + 90.0) / (topLat + 90.0) * size.height;
      }
    }

    // paint "normal" tile of earth on the current zoom level
    canvas.drawImageRect(
      bgMapImage,
      Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );

    if (zoom > 1.0) {
      if (rectLeft + rectWidth > imageWidth) {
        // near meridian 180° on the east, must draw also a tile of map
        // with left side on -180° to the right side of canvas
        final overWidth = (rectLeft + rectWidth) - imageWidth;
        canvas.drawImageRect(
          bgMapImage,
          Rect.fromLTWH(0, rectTop, overWidth, rectHeight),
          Rect.fromLTWH((rectWidth - overWidth) / rectWidth * size.width, 0,
              overWidth / rectWidth * size.width, size.height),
          Paint(),
        );
      } else if (rectLeft < 0) {
        // near meridian -180° on the west, must draw also a tile of map
        // with right side on 180° to the left side of canvas
        final overWidth = rectLeft.abs();
        canvas.drawImageRect(
          bgMapImage,
          Rect.fromLTWH(imageWidth - overWidth, rectTop, overWidth, rectHeight),
          Rect.fromLTWH(0, 0, overWidth / rectWidth * size.width, size.height),
          Paint(),
        );
      }
    }

    // draw earthquake symbol (sized by magnitude / significance)
    final center = Offset(leftOnCanvas, topOnCanvas);
    final sz = min(size.height / 100.0, 2.0);
    final radius = earthquake.magnitude * sz;
    if (checkIsWeb()) {
      // for web canvas seems to be quite limited, have to draw a raster symbol
      // (at least on Jan 2020 couldn't draw ovals on Flutter web...)
      if (mapSymbolImage != null) {
        final src = Rect.fromLTWH(0, 0, mapSymbolImage.width.toDouble(),
            mapSymbolImage.height.toDouble());
        final dst = Rect.fromCircle(center: center, radius: 1.5 * radius);
        //debugPrint('on web - drawing symbol: ${src} ${dst}');
        canvas.drawImageRect(mapSymbolImage, src, dst, Paint());
      }
    } else {
      // for mobile platfroms painting circles should work
      final stroke = Paint()
        ..color = Colors.black
        ..strokeWidth = sz
        ..style = PaintingStyle.stroke;
      final fill = Paint()..color = Colors.orangeAccent.withAlpha(0x90);
      final symbolRect = Rect.fromCircle(center: center, radius: radius);
      canvas.drawOval(symbolRect, stroke);
      canvas.drawOval(symbolRect, fill);
    }
  }

  @override
  bool shouldRepaint(MapPainter oldDelegate) => this.zoom != oldDelegate.zoom;

  @override
  bool shouldRebuildSemantics(MapPainter oldDelegate) => false;
}
