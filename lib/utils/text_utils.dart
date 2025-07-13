class TextUtils {
  static final RegExp _punctuationRegex = RegExp(r'[^\p{L}\p{N}\s]', unicode: true);
  static final RegExp _numberRegex = RegExp(r'\d+');
  static final RegExp _extraSpacesRegex = RegExp(r'\s+', multiLine: true);
  static final RegExp _htmlTagRegex = RegExp(r'<[^>]*>');
  static final RegExp _urlRegex = RegExp(r'https?:\/\/\S+');
  static final RegExp _emailRegex = RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b');
  static final RegExp _emojiRegex = RegExp(
    r'([\\u{1F600}-\\u{1F64F}]|[\\u{1F300}-\\u{1F5FF}]|[\\u{1F680}-\\u{1F6FF}]|[\\u{2600}-\\u{26FF}]|[\\u{2700}-\\u{27BF}])',
    unicode: true,
  );

  static String toLowerCaseUnicode(String input) => input.toLowerCase();

  static String removePunctuation(String input) =>
      input.replaceAll(_punctuationRegex, '');

  static String removeNumbers(String input) =>
      input.replaceAll(_numberRegex, '');

  static String removeExtraSpaces(String input) =>
      input.replaceAll(_extraSpacesRegex, ' ');

  static String removeHtmlTags(String input) =>
      input.replaceAll(_htmlTagRegex, '');

  static String removeUrls(String input) =>
      input.replaceAll(_urlRegex, '');

  static String removeEmails(String input) =>
      input.replaceAll(_emailRegex, '');

  static String removeEmojis(String input) =>
      input.replaceAll(_emojiRegex, '');

  static String removeSpecialCharacters(String input, {String language = 'en'}) {
    if (language == 'tr') {
      // Türkçe karakterler ve boşluklar korunsun
      return input.replaceAll(RegExp(r'[^a-zA-Z0-9ğüşıöçĞÜŞİÖÇ\s]'), '');
    }
    return input.replaceAll(RegExp(r'[^\p{L}\p{N}\s]', unicode: true), '');
  }

  static String removeStopwords(String input, String language) {
    final stopSet = _stopwords[language] ?? {};
    final words = input.split(' ');
    final filtered = words.where((word) => !stopSet.contains(word.toLowerCase()));
    return filtered.join(' ');
  }

  static const Map<String, Set<String>> _stopwords = {
    'en': {
      'the', 'is', 'in', 'at', 'which', 'on', 'a', 'an', 'and', 'or',
      'but', 'to', 'with', 'of', 'for', 'as', 'by', 'this', 'that', 'it',
      'be', 'are', 'was', 'were', 'has', 'have', 'had', 'do', 'does'
    },
    'tr': {
      've', 'bir', 'bu', 'şu', 'o', 'da', 'de', 'ile', 'gibi', 'için',
      'ama', 'fakat', 'veya', 'ya', 'ki', 'en', 'çok', 'az', 'şey', 'ne', 'mi'
    },
  };
}