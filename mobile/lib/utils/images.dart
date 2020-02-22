// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

import 'dart:async';
import 'dart:ui' as $ui;

import 'package:flutter/services.dart' show rootBundle;

// Load image asset as Image of dart:ui package.
Future<$ui.Image> loadImageAsset(String path) async {
  //print('Loading $path');
  final bytes = await rootBundle.load(path);
  final codec = await $ui.instantiateImageCodec(bytes.buffer.asUint8List());
  final frame = await codec.getNextFrame();
  return frame.image;
}
