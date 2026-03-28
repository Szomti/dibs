import 'dart:io';

import 'package:path_provider/path_provider.dart';

final class AppFileSystem {
  static final AppFileSystem instance = AppFileSystem._();

  final _storageDirectoryName = 'local_storage';

  AppFileSystem._();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<Directory> get storageDir async {
    final localPath = await _localPath;
    final directory = Directory('$localPath/$_storageDirectoryName');
    await directory.create();
    return directory;
  }
}