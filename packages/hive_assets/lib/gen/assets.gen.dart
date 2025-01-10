/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Contract_Senal.png
  AssetGenImage get contractSenal =>
      const AssetGenImage('assets/images/Contract_Senal.png');

  /// File path: assets/images/Contract_Signed.png
  AssetGenImage get contractSigned =>
      const AssetGenImage('assets/images/Contract_Signed.png');

  /// File path: assets/images/Ecoes.png
  AssetGenImage get ecoes => const AssetGenImage('assets/images/Ecoes.png');

  /// File path: assets/images/Inprocess.png
  AssetGenImage get inprocess =>
      const AssetGenImage('assets/images/Inprocess.png');

  /// File path: assets/images/Live.png
  AssetGenImage get live => const AssetGenImage('assets/images/Live.png');

  /// File path: assets/images/Lost.png
  AssetGenImage get lost => const AssetGenImage('assets/images/Lost.png');

  /// File path: assets/images/Objection.png
  AssetGenImage get objection =>
      const AssetGenImage('assets/images/Objection.png');

  /// File path: assets/images/Quoted.png
  AssetGenImage get quoted => const AssetGenImage('assets/images/Quoted.png');

  /// File path: assets/images/Registration.png
  AssetGenImage get registration =>
      const AssetGenImage('assets/images/Registration.png');

  /// File path: assets/images/app_logo.svg
  SvgGenImage get appLogo => const SvgGenImage('assets/images/app_logo.svg');

  /// File path: assets/images/background.svg
  SvgGenImage get background =>
      const SvgGenImage('assets/images/background.svg');

  /// File path: assets/images/gif1.gif
  AssetGenImage get gif1 => const AssetGenImage('assets/images/gif1.gif');

  /// File path: assets/images/gif2.gif
  AssetGenImage get gif2 => const AssetGenImage('assets/images/gif2.gif');

  /// File path: assets/images/gif3.gif
  AssetGenImage get gif3 => const AssetGenImage('assets/images/gif3.gif');

  /// File path: assets/images/hive_blog_logo.svg
  SvgGenImage get hiveBlogLogo =>
      const SvgGenImage('assets/images/hive_blog_logo.svg');

  /// File path: assets/images/pe_logo_black.png
  AssetGenImage get peLogoBlack =>
      const AssetGenImage('assets/images/pe_logo_black.png');

  /// File path: assets/images/pe_logo_blue.png
  AssetGenImage get peLogoBlue =>
      const AssetGenImage('assets/images/pe_logo_blue.png');

  /// File path: assets/images/pe_logo_color.png
  AssetGenImage get peLogoColor =>
      const AssetGenImage('assets/images/pe_logo_color.png');

  /// File path: assets/images/pe_logo_white.png
  AssetGenImage get peLogoWhite =>
      const AssetGenImage('assets/images/pe_logo_white.png');

  /// File path: assets/images/qa.png
  AssetGenImage get qa => const AssetGenImage('assets/images/qa.png');

  /// File path: assets/images/request.png
  AssetGenImage get request => const AssetGenImage('assets/images/request.png');

  /// File path: assets/images/traffic.png
  AssetGenImage get traffic => const AssetGenImage('assets/images/traffic.png');

  /// File path: assets/images/user_dummy.png
  AssetGenImage get userDummy =>
      const AssetGenImage('assets/images/user_dummy.png');

  /// List of all assets
  List<dynamic> get values => [
        contractSenal,
        contractSigned,
        ecoes,
        inprocess,
        live,
        lost,
        objection,
        quoted,
        registration,
        appLogo,
        background,
        gif1,
        gif2,
        gif3,
        hiveBlogLogo,
        peLogoBlack,
        peLogoBlue,
        peLogoColor,
        peLogoWhite,
        qa,
        request,
        traffic,
        userDummy
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/internet_error.json
  LottieGenImage get internetError =>
      const LottieGenImage('assets/lottie/internet_error.json');

  /// File path: assets/lottie/thumb.json
  LottieGenImage get thumb => const LottieGenImage('assets/lottie/thumb.json');

  /// List of all assets
  List<LottieGenImage> get values => [internetError, thumb];
}

class HiveAssets {
  HiveAssets._();

  static const String package = 'hive_assets';

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  static const String package = 'hive_assets';

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/hive_assets/$_assetName';
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  static const String package = 'hive_assets';

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/hive_assets/$_assetName';
}

class LottieGenImage {
  const LottieGenImage(this._assetName);

  final String _assetName;

  static const String package = 'hive_assets';

  LottieBuilder lottie({
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    void Function(LottieComposition)? onLoaded,
    LottieImageProviderFactory? imageProviderFactory,
    Key? key,
    AssetBundle? bundle,
    Widget Function(BuildContext, Widget, LottieComposition?)? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
    void Function(String)? onWarning,
  }) {
    return Lottie.asset(
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

  String get keyName => 'packages/hive_assets/$_assetName';
}
