/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:lottie/lottie.dart' as _lottie;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetIconsGen {
  const $AssetIconsGen();

  /// File path: asset/icons/app_icon.svg
  SvgGenImage get appIcon => const SvgGenImage('asset/icons/app_icon.svg');

  /// File path: asset/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('asset/icons/calendar.svg');

  /// File path: asset/icons/design.svg
  SvgGenImage get design => const SvgGenImage('asset/icons/design.svg');

  /// File path: asset/icons/empty_task.svg
  SvgGenImage get emptyTask => const SvgGenImage('asset/icons/empty_task.svg');

  /// File path: asset/icons/filter.svg
  SvgGenImage get filter => const SvgGenImage('asset/icons/filter.svg');

  /// File path: asset/icons/flag.svg
  SvgGenImage get flag => const SvgGenImage('asset/icons/flag.svg');

  /// File path: asset/icons/grocery.svg
  SvgGenImage get grocery => const SvgGenImage('asset/icons/grocery.svg');

  /// File path: asset/icons/health.svg
  SvgGenImage get health => const SvgGenImage('asset/icons/health.svg');

  /// File path: asset/icons/home_view.svg
  SvgGenImage get homeView => const SvgGenImage('asset/icons/home_view.svg');

  /// File path: asset/icons/house.svg
  SvgGenImage get house => const SvgGenImage('asset/icons/house.svg');

  /// File path: asset/icons/movie.svg
  SvgGenImage get movie => const SvgGenImage('asset/icons/movie.svg');

  /// File path: asset/icons/music.svg
  SvgGenImage get music => const SvgGenImage('asset/icons/music.svg');

  /// File path: asset/icons/progress.svg
  SvgGenImage get progress => const SvgGenImage('asset/icons/progress.svg');

  /// File path: asset/icons/send.svg
  SvgGenImage get send => const SvgGenImage('asset/icons/send.svg');

  /// File path: asset/icons/social.svg
  SvgGenImage get social => const SvgGenImage('asset/icons/social.svg');

  /// File path: asset/icons/sport.svg
  SvgGenImage get sport => const SvgGenImage('asset/icons/sport.svg');

  /// File path: asset/icons/tag.svg
  SvgGenImage get tag => const SvgGenImage('asset/icons/tag.svg');

  /// File path: asset/icons/task.svg
  SvgGenImage get task => const SvgGenImage('asset/icons/task.svg');

  /// File path: asset/icons/timeout.svg
  SvgGenImage get timeout => const SvgGenImage('asset/icons/timeout.svg');

  /// File path: asset/icons/timer.svg
  SvgGenImage get timer => const SvgGenImage('asset/icons/timer.svg');

  /// File path: asset/icons/trash.svg
  SvgGenImage get trash => const SvgGenImage('asset/icons/trash.svg');

  /// File path: asset/icons/university.svg
  SvgGenImage get university => const SvgGenImage('asset/icons/university.svg');

  /// File path: asset/icons/user.svg
  SvgGenImage get user => const SvgGenImage('asset/icons/user.svg');

  /// File path: asset/icons/work.svg
  SvgGenImage get work => const SvgGenImage('asset/icons/work.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        appIcon,
        calendar,
        design,
        emptyTask,
        filter,
        flag,
        grocery,
        health,
        homeView,
        house,
        movie,
        music,
        progress,
        send,
        social,
        sport,
        tag,
        task,
        timeout,
        timer,
        trash,
        university,
        user,
        work
      ];
}

class $AssetLottieGen {
  const $AssetLottieGen();

  /// File path: asset/lottie/empty_calendar.json
  LottieGenImage get emptyCalendar =>
      const LottieGenImage('asset/lottie/empty_calendar.json');

  /// List of all assets
  List<LottieGenImage> get values => [emptyCalendar];
}

class Assets {
  Assets._();

  static const $AssetIconsGen icons = $AssetIconsGen();
  static const $AssetLottieGen lottie = $AssetLottieGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class LottieGenImage {
  const LottieGenImage(
    this._assetName, {
    this.flavors = const {},
  });

  final String _assetName;
  final Set<String> flavors;

  _lottie.LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    _lottie.FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    _lottie.LottieDelegates? delegates,
    _lottie.LottieOptions? options,
    void Function(_lottie.LottieComposition)? onLoaded,
    _lottie.LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(
      BuildContext,
      Widget,
      _lottie.LottieComposition?,
    )? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    String? package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return _lottie.Lottie.asset(
      _assetName,
      controller: controller,
      animate: animate,
      frameRate: frameRate,
      repeat: repeat,
      reverse: reverse,
      delegates: delegates,
      options: options,
      onLoaded: onLoaded,
      imageProviderFactory: imageProviderFactory,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      package: package,
      addRepaintBoundary: addRepaintBoundary,
      filterQuality: filterQuality,
      onWarning: onWarning,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
