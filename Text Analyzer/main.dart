import 'dart:io';

void main() {
  print('Enter the file path:');
  var path = stdin.readLineSync();

  if (path == null) {
    print('File path is required');
    return;
  }

  var text = File(path).readAsStringSync();
  var paragraphs = text.split('\n\n');
  var wordCount = 0;
  var sentenceCount = 0;

  for (var paragraph in paragraphs) {
    var sentences = paragraph.split(RegExp(r'[.!?]+'));
    sentenceCount += sentences.length;
    for (var sentence in sentences) {
      var words = sentence.trim().split(' ');
      wordCount += words.length;
    }
  }

  print('Number of words: $wordCount');
  print('Number of sentences: $sentenceCount');
  print('Number of paragraphs: ${paragraphs.length}');
}