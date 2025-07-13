import '../models/clean_config.dart';
import '../utils/text_utils.dart';

typedef TextFilter = String Function(String);

/// Main class to clean text using modular filters.
class BasicCleaner {
  final CleanConfig config;

  BasicCleaner({CleanConfig? config})
      : config = config ?? const CleanConfig();

  /// Cleans the given text by applying selected filters.
  String clean(String input) {
    List<TextFilter> pipeline = [];

    if (config.toLowerCase) pipeline.add(TextUtils.toLowerCaseUnicode);
    if (config.removeHtml) pipeline.add(TextUtils.removeHtmlTags);
    if (config.removeUrls) pipeline.add(TextUtils.removeUrls);
    if (config.removeEmails) pipeline.add(TextUtils.removeEmails);
    if (config.removeEmojis) pipeline.add(TextUtils.removeEmojis);
    if (config.removeNumbers) pipeline.add(TextUtils.removeNumbers);
    if (config.removePunctuation) pipeline.add(TextUtils.removePunctuation);
    if (config.removeSpecialChars) {
      pipeline.add((text) => TextUtils.removeSpecialCharacters(text, language: config.language));
    }
    if (config.removeExtraSpaces) pipeline.add(TextUtils.removeExtraSpaces);
    if (config.removeStopwords) {
      pipeline.add((text) => TextUtils.removeStopwords(text, config.language));
    }

    if (config.customFilters != null) {
      pipeline.addAll(config.customFilters!);
    }

    return pipeline.fold<String>(input, (text, filter) => filter(text)).trim();
  }
}
