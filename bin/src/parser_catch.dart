import 'dart:io';

import 'package:args/args.dart';
import 'package:grinder/grinder.dart';

import 'options.dart';

void parserCatch(ArgResults results, ArgParser parser) {
  Options.parse(results);
  if (Options.help ?? false) {
    log(parser.usage);
    exit(0);
  }
}
