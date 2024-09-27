import 'dart:io';

void main() {
  var tasks = <String>[];
  var file = File('tasks.txt');
  if (file.existsSync()) {
    tasks = file.readAsLinesSync();
  }

  while (true) {
    stdout.write('Enter a command (add/delete/view/exit): ');
    var command = stdin.readLineSync();

    switch (command) {
      case 'add':
        stdout.write('Enter task to add: ');
        var task = stdin.readLineSync();
        if (task != null) {
          tasks.add(task);
          print('Task added.');
        } else {
          print("No task added");
        }
        break;

      case 'delete':
        stdout.write('Enter index of task to delete: ');
        var index = int.tryParse(stdin.readLineSync() ?? '');
        if (index == null) {
          print('Invalid index');
          break;
        }
        if (index >= 0 && index < tasks.length) {
          tasks.removeAt(index);
          print('Task deleted.');
        } else {
          print('Invalid index.');
        }
        break;

      case 'view':
        print('Tasks:');
        for (var i = 0; i < tasks.length; i++) {
          print('$i. ${tasks[i]}');
        }
        break;

      case 'exit':
        print('Goodbye!');
        file.writeAsStringSync(tasks.join('\n'));
        return;

      default:
        print('Invalid command.');
        break;
    }
  }
}