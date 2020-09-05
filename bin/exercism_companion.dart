import 'dart:io';

import 'package:args/args.dart';
import 'package:exercism_companion/exercism_companion.dart';

///  Entry point of the program.
///
/// The companion has two options :
/// - `--help` to display the help informations
/// - `--uuid=<uuid>` to verify the exercise with the following uuid
void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()
    ..addOption('uuid', abbr: 'u', help: 'The solution UUID - mandatory')
    ..addOption(
      'help',
      abbr: 'h',
      help: 'Displays this help information.',
    );

  final argResults = parser.parse(arguments);
  if (argResults['help'] != null) _displayHelp(parser);
  if (argResults['uuid'] != null) exercismCompanion(argResults['uuid']);
}

void _displayHelp(ArgParser parser) {
  print('''
Download an exercise by providing the UUID.
  
Check if the code compile and if all tests are OK.
  
${parser.usage}
''');
}
