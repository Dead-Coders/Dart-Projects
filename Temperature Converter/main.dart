import 'dart:io';

void main() {
  stdout.write('Enter temperature: ');
  var input = stdin.readLineSync();

  stdout.write('Convert to (F)ahrenheit or (C)elsius? ');
  var choice = stdin.readLineSync()?.toLowerCase();

  var temperature = double.tryParse(input ?? '');
  if (temperature == null) {
    print('Invalid temperature input');
    return;
  }

  double result;
  String unit;

  if (choice == 'f') {
    result = temperature * 9 / 5 + 32;
    unit = 'F';
  } else if (choice == 'c') {
    result = (temperature - 32) * 5 / 9;
    unit = 'C';
  } else {
    print('Invalid choice');
    return;
  }

  print('$temperature° ${unit == 'F' ? 'C' : 'F'} is $result° $unit');
}
