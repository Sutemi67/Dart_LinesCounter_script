import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.BasicFileAttributes;

public class KotlinLineCounter {

    private static int totalLines = 0;

    public static void main(String[] args) {
        Path currentDir = Paths.get("").toAbsolutePath().normalize();
        System.out.println("Scanning directory: " + currentDir);

        try {
            Files.walkFileTree(currentDir, new SimpleFileVisitor<Path>() {
                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) {
                    if (file.toString().endsWith(".kt")) {
                        try {
                            long lines = Files.lines(file).count();
                            totalLines += (int) lines;
                        } catch (IOException e) {
                            // Пропускаем недоступные файлы
                        }
                    }
                    return FileVisitResult.CONTINUE;
                }

                @Override
                public FileVisitResult visitFileFailed(Path file, IOException exc) {
                    // Пропускаем недоступные файлы/директории
                    return FileVisitResult.CONTINUE;
                }
            });
        } catch (IOException e) {
            System.err.println("Error walking directory tree: " + e.getMessage());
        }

        System.out.println("Total Kotlin lines: " + totalLines);
    }
}