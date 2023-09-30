import 'package:flutter/widgets.dart';

enum Variant {
  primary,
  secondary,
}

const variationsColors = {
  Variant.primary: [Color(0xff09DDFF), Color(0xff09FFD6), Color(0xff09FFD6)],
  Variant.secondary: [Color(0xff001231), Color(0xff001231), Color(0xff001231)],
};

enum ActionButtonVariant {
  primary,
  secondary,
  blue,
  red,
}

const actionButtonVariationsColors = {
  ActionButtonVariant.primary: [
    Color(0xff09DDFF),
    Color(0xff09FFD6),
    Color(0xff09FFD6)
  ],
  ActionButtonVariant.secondary: [
    Color(0xff001231),
    Color(0xff001231),
    Color(0xff001231)
  ],
  ActionButtonVariant.blue: [
    Color(0xff0972FF),
    Color(0xff0972FF),
    Color(0xff0972FF)
  ],
  ActionButtonVariant.red: [
    Color(0xffFF096B),
    Color(0xffFF096B),
    Color(0xffFF096B)
  ],
};
