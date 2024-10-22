import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class BottomSheetBase {
  const BottomSheetBase._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isScrollControlled = true,
  }) async {
    return Platform.isIOS
        ? showCupertinoModalPopup<T>(
            context: context,
            builder: builder,
          )
        : showModalBottomSheet<T>(
            context: context,
            isScrollControlled: isScrollControlled,
            builder: builder,
          );
  }
}
