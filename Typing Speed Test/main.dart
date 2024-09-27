import 'dart:io';
import 'dart:math';

void main() {
  final String textToType = "The quick brown fox jumps over the lazy dog.";

  print("Type the following text as fast and accurately as possible:");
  print(textToType);

  final Stopwatch stopwatch = Stopwatch()..start();

  final String userInput = stdin.readLineSync()!;

  stopwatch.stop();

  final int typingSpeed = ((textToType.split(" ").length / stopwatch.elapsedMilliseconds) * 60000).round();
  final int accuracy = calculateAccuracy(textToType, userInput);

  print("Typing speed: $typingSpeed words per minute");
  print("Accuracy: $accuracy%");
}

int calculateAccuracy(String expectedText, String userInput) {
  int errors = 0;

  for (int i = 0; i < min(expectedText.length, userInput.length); i++) {
    if (expectedText[i] != userInput[i]) {
      errors++;
    }
  }

  return ((1 - (errors / expectedText.length)) * 100).round();
}