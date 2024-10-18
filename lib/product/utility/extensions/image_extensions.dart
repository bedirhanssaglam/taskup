import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:task_management/product/constants/app_constants.dart';

extension AssetGenImageExtension on AssetGenImage {
  Image show({
    Key? key,
    double? width,
    double? height,
    Color? color,
    BoxFit? fit,
  }) {
    return Image.asset(
      path,
      package: AppConstants.genPackageName,
      key: key,
      width: width,
      height: height,
      color: color,
      fit: fit,
    );
  }

  ImageProvider imageProvider() {
    return AssetImage(
      path,
      package: AppConstants.genPackageName,
    );
  }
}
