import 'package:test/test.dart';
import 'package:ml_text_cleaner/ml_text_cleaner.dart';

void main() {
  group('BasicCleaner', () {
    test('removes punctuation, numbers, stopwords (tr)', () {
      final config = CleanConfig(removeStopwords: true, language: 'tr');
      final cleaner = BasicCleaner(config: config);
      final cleaned = cleaner.clean('Bu bir örnek cümledir ve çok önemlidir.');
      expect(cleaned, contains('örnek'));
      expect(cleaned, isNot(contains('bir')));
    });
  });
}
