//
/// Display System Information
///
import 'dart:io';

void main() {
  displaySystemInfo();
}

void displaySystemInfo() {
  print('System Information\n');

  // Operating System
  if (Platform.isWindows) {
    print('Operating System: Windows');
    print('Version: ${Platform.operatingSystemVersion}');
  } else if (Platform.isLinux) {
    print('Operating System: Linux');
    print('Version: ${Platform.operatingSystemVersion}');
  } else if (Platform.isMacOS) {
    print('Operating System: macOS');
    print('Version: ${Platform.operatingSystemVersion}');
  } else {
    print('Operating System: ${Platform.operatingSystem}');
  }

  // Processor
  print('\nProcessor Information');
  print('Number of Processors: ${Platform.numberOfProcessors}');
  print('System Architecture: ${Platform.operatingSystem}');

  // Memory
  print('\nMemory Information');
  final sysMem = ProcessInfo.currentRss;
  print('Total System Memory: ${sysMem ~/ 1024} KB');

  // Dart version
  print('\nDart Version');
  print('Version: ${Platform.version}');
  print('Dart Runtime: ${Platform.executable}');
}
