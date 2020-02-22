// Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
// Use of this source code is governed by a MIT-style license, see the LICENSE.
//
// Datetime string formatters.

import 'package:intl/intl.dart';

String formatLocalDateFromUTC(DateTime timeUTC) {
  // see https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

  final local = timeUTC.toLocal();
  final now = DateTime.now();

  final isToday = local.year == now.year && local.month == now.month && local.day == now.day;
  if(isToday) {
    final f = DateFormat.jm();
    return 'Today ${f.format(local)}';
  }
  
  final f = DateFormat("MMM d 'at'").add_jm();
  return f.format(local);
}

String formatDateUTC(DateTime utc) {
  if(!utc.isUtc) {
    return 'Not utc!';
  }
  final now = DateTime.now().toUtc();

  final isToday = utc.year == now.year && utc.month == now.month && utc.day == now.day;
  if(isToday) {
    final f = DateFormat.jm();
    return 'Today ${f.format(utc)} UTC';
  }
  
  final f = DateFormat("MMM d 'at'").add_jm();
  return '${f.format(utc)} UTC';
}

String formatTimeAgoFromUTC(DateTime timeUTC) {
  final local = timeUTC.toLocal();
  final now = DateTime.now();
  final diff = now.difference(local);

  var num = 0;
  var unit = '';
  if(diff.inDays > 0) {
    num = diff.inDays;
    unit = num == 1 ? 'day' : 'days';
  }
  else if(diff.inHours > 0) {
    num = diff.inHours;
    unit = num == 1 ? 'hour' : 'hours';
  }
  else if(diff.inMinutes > 0) {
    num = diff.inMinutes;
    unit = num == 1 ? 'minute' : 'minutes';
  }
  else if(diff.inSeconds > 0) {
    num = diff.inSeconds;
    unit = num == 1 ? 'second' : 'seconds';
  }

  if(num > 0) {
    return '${num} ${unit} ago';
  }

  return 'Just now';
}