import 'dart:ui';
import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color lightBlueColor = hexToColor('#8BCFF4');
  static Color moreLightBlueColor = hexToColor('#E1F4FF');
  static Color darkBlueColor = hexToColor('#3C5CA5');
  static Color moreDarkBlueColor = hexToColor('#3B5BA4');
  static Color blueColor = hexToColor('#5E92F3');

  static Color lightPinkColor = hexToColor('#FFD7FB');
  static Color pinkColor = hexToColor('#E0083C');
  static Color redColor = hexToColor('#C90938');

  static Color greenColor = hexToColor('#13C67B');
  static Color lightGreenColor = hexToColor('#C0FDE7');
  static Color secondGreenColor = hexToColor('#139D64');
}
