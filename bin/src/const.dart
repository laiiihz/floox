import 'dart:io';

import 'package:path/path.dart';

import 'options.dart';

List<String> generateDirs = [
  'assets',
  join('lib', 'const'),
  join('lib', 'l10n'),
  join('lib', 'models'),
  join('lib', 'provider'),
  join('lib', 'user_interface'),
  join('lib', 'user_interface', 'widgets'),
  join('lib', 'utils'),
];

List<String> generateFiles = [
  join('lib', 'provider', 'app_provider.dart'),
  join('lib', 'const', 'app_theme.dart'),
  join('lib', 'main.dart'),
  join('analysis_options.yaml'),
];

const packages = [
  'dio',
  'flutter_screenutil',
  'get',
  'url_launcher',
  'flutter_easyrefresh',
  'flustars',
  'power_logger',
  'hive',
  'path_provider',
  'provider',
  'bot_toast',
  'intl',
];

const devPackages = [
  'build_runner',
  'json_serializable',
  'hive_generator',
  'import_sorter',
  'pedantic',
  'grinder',
];

const sdkPackages = [
  'flutter_localizations',
];

class GenFiles {
  static File _getFile(String path) {
    return File(join('.', Options.name, path));
  }

  static File get appProvider => _getFile(generateFiles[0]);
  static File get appTheme => _getFile(generateFiles[1]);
  static File get main => _getFile(generateFiles[2]);
  static File get analysis => _getFile(generateFiles[3]);
}
