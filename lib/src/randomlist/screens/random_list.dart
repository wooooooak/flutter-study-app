import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_app/src/randomlist/bloc/Bloc.dart';
import 'package:flutter_study_app/src/saved.dart';

import '../../saved.dart';

class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestion = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("naming app"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SavedList()));
            },
          )
        ],
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
        stream: bloc.savedStream,
        builder: (context, snapshot) {
          return ListView.builder(itemBuilder: (context, index) {
            if (index.isOdd) {
              return Divider();
            }
            var readIndex = index ~/ 2;
            if (readIndex >= _suggestion.length) {
              _suggestion.addAll(generateWordPairs().take(10));
            }

            return _listItem(snapshot.data, _suggestion[readIndex]);
          });
        });
  }

  Widget _listItem(Set<WordPair> saved, WordPair pair) {
    final bool alreadySaved = saved == null ? false : saved.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: Colors.pinkAccent,
      ),
      onTap: () {
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
