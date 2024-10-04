import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/constants/app_constants.dart';

extension SvgGenImageExtension on SvgGenImage {
  SvgPicture show({
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      path,
      key: key,
      package: AppConstants.genPackageName,
      width: width,
      height: height,
      fit: fit,
    );
  }

  SvgPicture colored(
    Color color, {
    Key? key,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return SvgPicture.asset(
      path,
      key: key,
      package: AppConstants.genPackageName,
      width: width,
      height: height,
      fit: fit,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
