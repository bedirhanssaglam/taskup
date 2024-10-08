import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:lottie/lottie.dart';
import 'package:task_management/product/constants/app_constants.dart';

extension AssetGenLottieExtension on LottieGenImage {
  LottieBuilder show({
    bool repeat = false,
    bool? reverse,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
  }) {
    return Lottie.asset(
      path,
      repeat: repeat,
      width: width,
      height: height,
      fit: fit,
      package: AppConstants.genPackageName,
    );
  }
}
