import 'dart:io';

void main() {
  print('Enter a password:');
  final password = stdin.readLineSync()!;
  final strength = getPasswordStrength(password);
  print('Password strength: $strength');
}

String getPasswordStrength(String password) {
  int score = 0;

  // Add points for password length
  if (password.length >= 8) {
    score += 1;
  }
  if (password.length >= 12) {
    score += 1;
  }
  if (password.length >= 16) {
    score += 1;
  }

  // Add points for using a mix of uppercase and lowercase letters
  if (RegExp(r'[a-z]').hasMatch(password) && RegExp(r'[A-Z]').hasMatch(password)) {
    score += 1;
  }

  // Add points for using digits and/or symbols
  if (RegExp(r'd').hasMatch(password)) {
    score += 1;
  }
  if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    score += 1;
  }

  // Return a rating based on the total score
  if (score < 2) {
    return 'Weak';
  } else if (score < 4) {
    return 'Moderate';
  } else {
    return 'Strong';
  }
}