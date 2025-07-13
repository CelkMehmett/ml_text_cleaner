import 'package:ml_text_cleaner/ml_text_cleaner.dart';

void main() {
  const rawText = '''
  Hello! 👋 This is <b>an</b> example text with URL: https://example.com,
  an email: example@test.com, and some numbers: 12345. Enjoy! 😄
  ''';

  final cleaner = BasicCleaner(
    config: CleanConfig(
      removeStopwords: true,
      language: 'en',
      removeEmojis: true,
    ),
  );

  final cleaned = cleaner.clean(rawText);
  print('Original Text:\n\$rawText\n');
  print('Cleaned Text:\n\$cleaned');
}
