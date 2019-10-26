import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:werry/utils/dimens_utils.dart';

class SizeBoxUtils {
  static const Widget hGap4 = const SizedBox(height: DimensUtils.size4);
  static const Widget hGap8 = const SizedBox(height: DimensUtils.size8);
  static const Widget hGap10 = const SizedBox(height: DimensUtils.size10);
  static const Widget hGap12 = const SizedBox(height: DimensUtils.size12);
  static const Widget hGap16 = const SizedBox(height: DimensUtils.size16);
  static const Widget hGap30 = const SizedBox(height: DimensUtils.size30);

  static const Widget wGap4 = const SizedBox(width: DimensUtils.size4);
  static const Widget wGap8 = const SizedBox(width: DimensUtils.size8);
  static const Widget wGap10 = const SizedBox(width: DimensUtils.size10);
  static const Widget wGap12 = const SizedBox(width: DimensUtils.size12);
  static const Widget wGap16 = const SizedBox(width: DimensUtils.size16);
  static const Widget wGap30 = const SizedBox(width: DimensUtils.size30);

  static Widget line = const Divider();
  
  static const Widget empty = const SizedBox();
}
