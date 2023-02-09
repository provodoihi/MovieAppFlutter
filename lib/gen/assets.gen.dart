/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/arrowCircleRight.png
  AssetGenImage get arrowCircleRight =>
      const AssetGenImage('assets/image/arrowCircleRight.png');

  /// File path: assets/image/avatar1.png
  AssetGenImage get avatar1 => const AssetGenImage('assets/image/avatar1.png');

  /// File path: assets/image/avatar1x1.png
  AssetGenImage get avatar1x1 =>
      const AssetGenImage('assets/image/avatar1x1.png');

  /// File path: assets/image/avatar2.png
  AssetGenImage get avatar2 => const AssetGenImage('assets/image/avatar2.png');

  /// File path: assets/image/avatar2x1.png
  AssetGenImage get avatar2x1 =>
      const AssetGenImage('assets/image/avatar2x1.png');

  /// File path: assets/image/avatar3.png
  AssetGenImage get avatar3 => const AssetGenImage('assets/image/avatar3.png');

  /// File path: assets/image/avatar3x1.png
  AssetGenImage get avatar3x1 =>
      const AssetGenImage('assets/image/avatar3x1.png');

  /// File path: assets/image/avatar4.png
  AssetGenImage get avatar4 => const AssetGenImage('assets/image/avatar4.png');

  /// File path: assets/image/avatar4x1.png
  AssetGenImage get avatar4x1 =>
      const AssetGenImage('assets/image/avatar4x1.png');

  /// File path: assets/image/avatar5.png
  AssetGenImage get avatar5 => const AssetGenImage('assets/image/avatar5.png');

  /// File path: assets/image/avatar6.png
  AssetGenImage get avatar6 => const AssetGenImage('assets/image/avatar6.png');

  /// File path: assets/image/avatar7.png
  AssetGenImage get avatar7 => const AssetGenImage('assets/image/avatar7.png');

  /// File path: assets/image/avatar8.png
  AssetGenImage get avatar8 => const AssetGenImage('assets/image/avatar8.png');

  /// File path: assets/image/avatarOutline.png
  AssetGenImage get avatarOutline =>
      const AssetGenImage('assets/image/avatarOutline.png');

  /// File path: assets/image/facebookLogo.png
  AssetGenImage get facebookLogo =>
      const AssetGenImage('assets/image/facebookLogo.png');

  /// File path: assets/image/googleLogo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/image/googleLogo.png');

  /// File path: assets/image/marvelLogo.png
  AssetGenImage get marvelLogo =>
      const AssetGenImage('assets/image/marvelLogo.png');

  /// File path: assets/image/onboard1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/image/onboard1.png');

  /// File path: assets/image/onboard2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/image/onboard2.png');

  /// File path: assets/image/onboard3.png
  AssetGenImage get onboard3 =>
      const AssetGenImage('assets/image/onboard3.png');

  /// File path: assets/image/onboard4.png
  AssetGenImage get onboard4 =>
      const AssetGenImage('assets/image/onboard4.png');

  /// File path: assets/image/onboard5.png
  AssetGenImage get onboard5 =>
      const AssetGenImage('assets/image/onboard5.png');

  /// File path: assets/image/onboard6.png
  AssetGenImage get onboard6 =>
      const AssetGenImage('assets/image/onboard6.png');

  /// File path: assets/image/splashScreen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/image/splashScreen.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        arrowCircleRight,
        avatar1,
        avatar1x1,
        avatar2,
        avatar2x1,
        avatar3,
        avatar3x1,
        avatar4,
        avatar4x1,
        avatar5,
        avatar6,
        avatar7,
        avatar8,
        avatarOutline,
        facebookLogo,
        googleLogo,
        marvelLogo,
        onboard1,
        onboard2,
        onboard3,
        onboard4,
        onboard5,
        onboard6,
        splashScreen
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    String? package,
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

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
