import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

import '../logging/soft_wrap_pretty_printer.dart';
import 'app_file_system.dart';

abstract class LocalDatasource<T extends Object> {
  static final _logger = Logger(
    printer: SoftWrapPrettyPrinter(dateTimeFormat: DateTimeFormat.onlyTime),
  );
  final String fileName;
  final String fileExtension;

  LocalDatasource({required this.fileName, this.fileExtension = 'json'});

  String get fullFileName => '$fileName.$fileExtension';

  Future<Directory> get storageDir => AppFileSystem.instance.storageDir;

  Future<T?> read();

  Future<void> write(T object);

  Future<void> delete() async {
    final file = await getStorageFile();
    if (!(file.existsSync())) return;
    await file.delete();
  }

  Future<File> getStorageFile() async {
    final directory = await storageDir;
    return File('${directory.path}/$fullFileName');
  }

  Future<Map<String, Object?>?> readFromFile() async {
    try {
      final file = await getStorageFile();
      if (!(file.existsSync())) return null;
      final content = await file.readAsString();
      if (content.isEmpty) return null;
      return json.decode(content);
    } catch (error, stackTrace) {
      _logger.f('File system error', error: error, stackTrace: stackTrace);
      return null;
    }
  }

  Future<void> writeToFile(Map<String, Object?> jsonObject) async {
    final file = await getStorageFile();
    await file.writeAsString(json.encode(jsonObject));
  }
}
