import '../models/word_model.dart';

class DatabaseService {
  static final List<WordModel> words = [];

  static void addWord(WordModel word) {
    words.add(word);
  }

  static List<WordModel> getWords() {
    return words;
  }
}