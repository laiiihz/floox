import 'package:args/args.dart';

class Options {
  static late String? name;
  static late String? org;
  static late bool? help;
  static late bool? nullsafety;

  static void parse(ArgResults results) {
    name = results['name'] ?? 'example';
    help = results['help'] ?? false;
    org = results['org'] ?? 'com.example';
    nullsafety = results['nullsafety'] ?? false;
  }
}
