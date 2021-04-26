import 'dart:io';

import 'package:args/args.dart';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart';

import 'src/const.dart';
import 'src/generator/_gen_analysis.dart';
import 'src/generator/_gen_main.dart';
import 'src/generator/_gen_provider.dart';
import 'src/generator/_gen_theme.dart';
import 'src/options.dart';
import 'src/parser_catch.dart';
import 'src/tool.dart';

void main(List<String> args) async {
  var parser = ArgParser();
  parser.addOption('name', help: 'project name');
  parser.addFlag(
    'help',
    help: 'help documents',
    negatable: false,
    defaultsTo: false,
  );
  parser.addFlag('nullsafety', help: 'nullsafety support');
  parser.addOption('org');
  var results = parser.parse(args);

  parserCatch(results, parser);

  await FlooxTool.init(Options.name ?? 'example');
  await FlooxTool.genDirs(generateDirs);
  await FlooxTool.genFiles(generateFiles);

  // add packages
  await FlooxTool.addPackages(packages);
  // add dev packages
  await FlooxTool.addPackages(devPackages, dev: true);

  await FlooxTool.addPackages(sdkPackages, sdk: true);

  await FlooxTool.writeFile(genProvider, GenFiles.appProvider);
  await FlooxTool.writeFile(genTheme, GenFiles.appTheme);
  await FlooxTool.writeFile(genAnalysis, GenFiles.analysis, noFormat: true);
  await FlooxTool.writeFile(
    genMain,
    GenFiles.main,
    beforeGen: () async {
      await File(join('.', Options.name, 'lib', 'main.dart')).delete();
    },
  );

  await FlooxTool.nullSafety();
  log('all done!');
}
