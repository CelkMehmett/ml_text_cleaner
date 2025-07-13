# 📚 ml_text_cleaner

A powerful, modular, and extensible text cleaning library for Dart & Flutter.

## ✨ Features

- Lowercase conversion (Unicode)
- Remove punctuation, numbers, special characters
- Remove HTML tags, URLs, emails, emojis
- Stopword removal (EN, TR)
- Chain custom filters via config
- Highly extensible

## 🚀 Example

```dart
final cleaner = BasicCleaner(
  config: CleanConfig(
    removeStopwords: true,
    language: 'en',
  ),
);

final cleaned = cleaner.clean("Hello! This is <b>an</b> example text with emojis 😄.");
print(cleaned); // hello example text emojis
```

## 📦 Installation

```bash
dart pub add ml_text_cleaner
```

## 🧪 Run tests

```bash
dart test
```

## 📄 License

MIT
