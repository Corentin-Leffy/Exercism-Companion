import 'dart:io';

/// The companion do the following steps :
///
/// 1. Download the exercise with the uuid
/// 2. Move to the downloaded folder
/// 3. Enabled all the tests by removing `skip: true`
/// 4. Fetch dependencies by running `pub get`
/// 5. Run tests by running `pub run test`
///
void exercismCompanion(String uuid) async {
  final fetchExercismResult = await _fetchExercise(uuid);
  if (fetchExercismResult.hasError) throw Error();

  final pathToFolder = (fetchExercismResult.stdout as String).trim();
  await _moveTo(pathToFolder);
  await _enableTests(pathToFolder);
  await _fetchDependencies();
  await _runTests();
}

Future<ProcessResult> _fetchExercise(String uuid) async {
  print('🌐  Download the exercise with uuid $uuid\n');

  return await Process.run('exercism', ['download', '--uuid', uuid]);
}

Future _moveTo(String pathToFolder) async {
  print('📂  Move to solution folder at $pathToFolder\n');

  Directory.current = pathToFolder;
}

Future _enableTests(String pathToFolder) async {
  print('📝  Enable tests at $pathToFolder\n');

  Directory('$pathToFolder/test')
      .listSync()
      .map((fileSystemEntity) => File(fileSystemEntity.path))
      .where((file) => file.existsSync())
      .forEach(_removeSkipTrue);
}

void _removeSkipTrue(File file) async {
  print('🔥  Remove "skip: true" for ${file.path}\n');

  final contents = await file.readAsString();
  final contentsWithTestsEnabled =
      contents.replaceAll('skip: true', 'skip: false');

  await File(file.path).writeAsString(contentsWithTestsEnabled);
}

Future _fetchDependencies() async {
  print('🔁  Fetch dependencies\n');

  final result = await Process.run('pub', ['get']);
  print(result.stdout);
}

Future _runTests() async {
  print('✅  Run tests\n');

  final result = await Process.run('pub', ['run', 'test']);
  print(result.stdout);
}

extension on ProcessResult {
  bool get hasError => exitCode != 0;
}
