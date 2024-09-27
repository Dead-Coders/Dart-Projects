///
/// File Size Calculator
/// 
import 'dart:io';

Future<void> main() async {
  final path = stdin.readLineSync()!;
  final file = File(path);
  if (await file.exists()) {
    final size = await getFileSize(file);
    final sizeInKb = size / 1024;
    print('Size of $path is ${sizeInKb.toStringAsFixed(2)} KB');
  } else {
    print('$path does not exist');
  }
}

Future<int> getFileSize(FileSystemEntity entity) async {
  if (await entity is File) {
    return (await (entity as File).length());
  } else if (await entity is Directory) {
    int size = 0;
    await for (final FileSystemEntity subEntity in (entity as Directory).list(recursive: true)) {
      if (await subEntity is File) {
        size += await (subEntity as File).length();
      }
    }
    return size;
  } else {
    throw FileSystemException('Unsupported entity type');
  }
}