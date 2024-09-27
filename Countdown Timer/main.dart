/// Countdown timer
/// 
import 'dart:async';
import 'dart:io';

void main() {
  print("Enter the countdown time in seconds:");
  int countdown = int.parse(stdin.readLineSync()!);

  print("Starting countdown...");
  
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    countdown--;
    
    if (countdown == 0) {
      print("Time's up!");
      timer.cancel();
    } else {
      print(countdown);
    }
  });
}