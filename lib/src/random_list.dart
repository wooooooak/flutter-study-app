import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/src/saved.dart';

import 'saved.dart';

class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestion = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    SavedList(saved: _saved,);

    return Scaffold(
      appBar: AppBar(
        title: Text("naming app"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SavedList(saved: _saved)));
            },
          )
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      if (index.isOdd) {
        return Divider();
      }
      var readIndex = index ~/ 2;
      if (readIndex >= _suggestion.length) {
        _suggestion.addAll(generateWordPairs().take(10));
      }

      return _listItem(_suggestion[readIndex]);
    });
  }

  Widget _listItem(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pinkAccent,
      ),
      onTap: () {
        setState(() {
          // setState가 실행되면, statefulWidget안의 내용들을 재시작해준다
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
