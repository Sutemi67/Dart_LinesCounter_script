import 'dart:io';

void main() {
  final currentDir = Directory.current;
  print('Scanning directory: ${currentDir.absolute.path}');

  int totalLines = 0;

  void scan(Directory dir) {
    try {
      for (final entity in dir.listSync(followLinks: false)) {
        if (entity is File && entity.path.endsWith('.kt')) {
          final content = entity.readAsStringSync();
          // Считаем количество строк
          totalLines += content.isEmpty ? 0 : content.split('\n').length;
        } else if (entity is Directory) {
          scan(entity);
        }
      }
    } catch (e) {
      // Пропускаем недоступные файлы/директории
    }
  }

  scan(currentDir);
  print('Total Kotlin lines: $totalLines');
}
