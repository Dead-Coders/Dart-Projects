import 'dart:math';
import 'dart:io';

void main() {
  stdout.write('Enter password length: ');
  var input = stdin.readLineSync();
  var length = int.tryParse(input ?? '12') ?? 12;
  var password = generatePassword(length);
  print('Random password: $password');
}
String generatePassword(int length) {
  var rand = Random.secure();
  var codeUnits = List.generate(length, (index) {
    return rand.nextInt(93) + 33;
  });
  return String.fromCharCodes(codeUnits);
}