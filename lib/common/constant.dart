import 'package:flutter/material.dart';
import 'package:werry/utils/colors_utils.dart';

class Constant {
  static const bool inProduction = const bool.fromEnvironment("dart.vm.product");

  static bool isTest = false;

  static const String data = 'data';
  static const String message = 'message';
  static const String code = 'code';

  static const String key_guide = 'key_guide';
  static const String phone = 'phone';
  static const String access_Token = 'accessToken';
  static const String refresh_Token = 'refreshToken';

  static const String theme = "AppTheme";

  static const List<String> orderLeftButtonText = ["拒单", "拒单", "订单跟踪", "订单跟踪", "订单跟踪"];
  static const List<String> orderRightButtonText = ["接单", "开始配送", "完成", "", ""];

  static const gradient_WaterMelon_Melon = LinearGradient(colors: [ColorsUtils.watermelon, ColorsUtils.melon]);
  static const List<Color> colorListMelonWaterMelon = [ColorsUtils.melon, ColorsUtils.watermelon];
}
