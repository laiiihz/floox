const genTheme = '''
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static init() {
    SystemChrome.setSystemUIOverlayStyle(defaultSystemStyle);
  }

  static SystemUiOverlayStyle get defaultSystemStyle => SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      );
  static ThemeData get lightTheme => ThemeData(primarySwatch: Colors.blue).copyWith();
}
''';
