part of '_constants.dart';

class Assets {
  static final svg = _SvgAssets();
  static final image = _ImageAssets();
}

class _SvgAssets {
  final String _basePath = 'assets/svgs';

  // String get search => '$_basePath/search.svg';
  // String get cancel => '$_basePath/cancel.svg';
}

class _ImageAssets {
  final String _basePath = 'assets/images';

  // String get spotify => '$_basePath/spotify.png';
}
