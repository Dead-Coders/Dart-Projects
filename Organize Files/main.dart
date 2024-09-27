import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Directory path is required');
    return;
  }

  organizeFiles(args[0]);
}

void organizeFiles(String directoryPath) {
  var directory = Directory(directoryPath);

  if (!directory.existsSync()) {
    print('Directory does not exist.');
    return;
  }

  var files = directory.listSync();
  for (var file in files) {
    if (file is File) {
      var category = getCategoryForFile(file.path);
      var newDirectory = Directory('${directory.path}/$category');
      if (!newDirectory.existsSync()) {
        newDirectory.createSync();
      }
      file.renameSync('${newDirectory.path}/${file.uri.pathSegments.last}');
    }
  }
  print('Files organized by category.');
}

String getCategoryForFile(String fileName) {
  var extension = fileName.split('.').last.toLowerCase();

  const imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'svg'];
  const movieExtensions = ['mp4', 'mkv', 'avi', 'mov', 'flv'];
  const documentExtensions = [
    'txt',
    'pdf',
    'doc',
    'docx',
    'ppt',
    'pptx',
    'xls',
    'xlsx'
  ];
  const programExtensions = ['exe', 'bat', 'sh', 'bin', 'jar'];

  if (imageExtensions.contains(extension)) {
    return 'images';
  } else if (movieExtensions.contains(extension)) {
    return 'movies';
  } else if (documentExtensions.contains(extension)) {
    return 'documents';
  } else if (programExtensions.contains(extension)) {
    return 'programs';
  } else {
    return 'others';
  }
}