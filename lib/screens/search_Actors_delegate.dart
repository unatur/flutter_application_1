import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelo/modelo.dart';

class SearchActorsDelegate extends SearchDelegate<Post> {
  List actores;
  List FiltroActores = [];

  SearchActorsDelegate(this.actores);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
            context,
            Post(
                char_Id: 0,
                name: 'name',
                birthday: 'birthday',
                occupation: ['occupation'],
                img: 'img',
                status: 'status',
                appearance: ['appearance'],
                nickname: 'nickname',
                portrayed: 'portrayed'));
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: FiltroActores.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(FiltroActores[index].name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print(actores);
    FiltroActores = actores.where((actor) {
      return actor.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: FiltroActores.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(FiltroActores[index].name),
        );
      },
    );
  }
}
