// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

const bool _isWeb = identical(0, 0.0);

// checks if the app is runned on web instead of mobile (or other platforms)
// (note : when the app is written, standard Platfrom class was not supported 
// on Flutter web, so this function was needed)
bool checkIsWeb() {
  return _isWeb;
}