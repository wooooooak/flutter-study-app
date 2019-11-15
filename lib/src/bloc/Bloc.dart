import 'dart:async';

import 'package:english_words/english_words.dart';

class Bloc {
  final saved = Set<WordPair>();

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _savedController.stream;


  emitCurrentSaved() => _savedController.sink.add(saved);

  addToOrRemoveFromSavedList(WordPair item) {
    if (saved.contains(item)) {
      saved.remove(item);
    } else {
      saved.add(item);
    }

    _savedController.sink.add(saved);
  }

  dispose() {
    _savedController.close();
  }
}

final bloc = Bloc();