// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.

double clipDouble(double value, double min, double max) {
  if(value < min) return min;
  if(value > max) return max;
  return value;
}
