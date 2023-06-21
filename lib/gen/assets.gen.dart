/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $IconsGen {
  const $IconsGen();

  /// File path: icons/ac.svg
  String get ac => 'icons/ac.svg';

  /// File path: icons/bell.svg
  String get bell => 'icons/bell.svg';

  /// File path: icons/bugs.svg
  String get bugs => 'icons/bugs.svg';

  /// File path: icons/cleans.svg
  String get cleans => 'icons/cleans.svg';

  /// File path: icons/home.svg
  String get home => 'icons/home.svg';

  /// File path: icons/ic_setting.svg
  String get icSetting => 'icons/ic_setting.svg';

  /// File path: icons/lights.svg
  String get lights => 'icons/lights.svg';

  /// File path: icons/more.svg
  String get more => 'icons/more.svg';

  /// File path: icons/orders.svg
  String get orders => 'icons/orders.svg';

  /// File path: icons/receipt.svg
  String get receipt => 'icons/receipt.svg';

  /// File path: icons/saw.svg
  String get saw => 'icons/saw.svg';

  /// File path: icons/settings.svg
  String get settings => 'icons/settings.svg';

  /// File path: icons/settingsLarge.svg
  String get settingsLarge => 'icons/settingsLarge.svg';

  /// File path: icons/user.svg
  String get user => 'icons/user.svg';

  /// File path: icons/water.svg
  String get water => 'icons/water.svg';

  /// List of all assets
  List<String> get values => [
        ac,
        bell,
        bugs,
        cleans,
        home,
        icSetting,
        lights,
        more,
        orders,
        receipt,
        saw,
        settings,
        settingsLarge,
        user,
        water
      ];
}

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/HomeService.png
  AssetGenImage get homeService =>
      const AssetGenImage('images/HomeService.png');

  /// File path: images/home.png
  AssetGenImage get home => const AssetGenImage('images/home.png');

  /// File path: images/img1.jpg
  AssetGenImage get img1 => const AssetGenImage('images/img1.jpg');

  /// File path: images/img2.png
  AssetGenImage get img2 => const AssetGenImage('images/img2.png');

  /// File path: images/img3.png
  AssetGenImage get img3 => const AssetGenImage('images/img3.png');

  /// File path: images/location.png
  AssetGenImage get location => const AssetGenImage('images/location.png');

  /// File path: images/profile.jpg
  AssetGenImage get profile => const AssetGenImage('images/profile.jpg');

  /// File path: images/splash.png
  AssetGenImage get splash => const AssetGenImage('images/splash.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [homeService, home, img1, img2, img3, location, profile, splash];
}

class Assets {
  Assets._();

  static const $IconsGen icons = $IconsGen();
  static const $ImagesGen images = $ImagesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
