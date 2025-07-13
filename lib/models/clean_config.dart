/// Configuration for text cleaning behavior.
class CleanConfig {
  final bool toLowerCase;
  final bool removeNumbers;
  final bool removePunctuation;
  final bool removeExtraSpaces;
  final bool removeStopwords;
  final bool removeSpecialChars;
  final bool removeHtml;
  final bool removeUrls;
  final bool removeEmails;
  final bool removeEmojis;
  final String language;
  final List<String Function(String)>? customFilters;

  const CleanConfig({
    this.toLowerCase = true,
    this.removeNumbers = true,
    this.removePunctuation = true,
    this.removeExtraSpaces = true,
    this.removeStopwords = false,
    this.removeSpecialChars = true,
    this.removeHtml = true,
    this.removeUrls = true,
    this.removeEmails = true,
    this.removeEmojis = false,
    this.language = 'en',
    this.customFilters,
  });
}
