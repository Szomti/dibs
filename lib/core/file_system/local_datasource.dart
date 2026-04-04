import 'dart:convert';
import 'dart:io';

import 'package:dibs/core/file_system/app_file_system.dart';
import 'package:flutter/foundation.dart';

abstract class LocalDatasource<T extends Object> {
  final String fileName;
  final String fileExtension;

  LocalDatasource({required this.fileName, this.fileExtension = 'json'});

  String get fullFileName => '$fileName.$fileExtension';

  Future<Directory> get storageDir => AppFileSystem.instance.storageDir;

  Future<T?> read();

  Future<void> write(T object);

  Future<File> getStorageFile() async {
    final directory = await storageDir;
    return File('${directory.path}/$fullFileName');
  }

  Future<Map<String, Object?>?> readFromFile() async {
    try {
      final file = await getStorageFile();
      if (!(await file.exists())) return null;
      final content = await file.readAsString();
      if (content.isEmpty) return null;
      return json.decode(content);
    } catch (error, stackTrace) {
      debugPrint('$error\n$stackTrace');
      return null;
    }
  }

  Future<void> writeToFile(Map<String, Object?> jsonObject) async {
    final file = await getStorageFile();
    await file.writeAsString(json.encode(jsonObject));
  }
}
