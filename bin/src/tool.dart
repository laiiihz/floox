import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart';

import 'options.dart';

class FlooxTool {
  static Future<void> init(String name) async {
    var extra = <String>[];
    log('create flutter project');
    if (Options.org != null) {
      extra.add('--org=${Options.org!}');
      await runAsync(
        'flutter',
        arguments: ['create', ...extra, name],
        quiet: true,
      );
      log('pub get');
      await runAsync(
        'flutter',
        arguments: ['pub', 'get'],
        workingDirectory: './${Options.name}',
        quiet: true,
      );
    }
  }

  static Future<void> addPackages(
    List<String> packages, {
    bool dev = false,
    bool sdk = false,
  }) async {
    for (var i = 0; i < packages.length; i++) {
      await runAsync(
        'flutter',
        arguments: [
          'pub',
          'add',
          packages[i],
          if (dev) '-d',
          if (sdk) '--sdk=flutter'
        ],
        workingDirectory: './${Options.name}',
        quiet: true,
      );

      stdout.write(
          '\r ${i + 1}/${packages.length} ${dev ? '[dev]' : ''}: ${'📦' * (i + 1)}');
    }
    log('\n');
  }

  static Future<void> genDirs(List<String> dirs) async {
    for (var i = 0; i < dirs.length; i++) {
      var assets = Directory(join('.', Options.name, dirs[i]));
      await assets.create(recursive: true);
    }
  }

  static Future<void> genFiles(List<String> files) async {
    for (var i = 0; i < files.length; i++) {
      var file = File(join('.', Options.name, files[i]));
      if (!await file.exists()) await file.create();
    }
  }

  static Future<void> nullSafety() async {
    if (Options.nullsafety ?? false) {
      await Dart.runAsync('migrate', arguments: ['--apply-changes']);
    }
  }

  static Future<void> writeFile(
    String str,
    File file, {
    Future Function()? beforeGen,
    bool noFormat = false,
  }) async {
    if (beforeGen != null) await beforeGen();
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(noFormat ? str : DartFormatter().format(str));
  }
}
