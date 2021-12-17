import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelo/modelo.dart';
import 'package:flutter_application_1/screens/app_bar.dart';
import 'package:flutter_application_1/screens/home_sreen.dart';
import 'package:flutter_application_1/screens/search_Actors_delegate.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Post>> _listadoActors;
  List listActors = [];

  Future<List<Post>> fetchPost() async {
    final response = await http
        .get(Uri.parse('https://www.breakingbadapi.com/api/characters/'));

    List<Post> actors = [];
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //print(jsonData[0]);
      for (var item in jsonData) {
        //print(item['birthday']);
        actors.add(Post(
            char_Id: item['char_id'],
            name: item['name'],
            birthday: item['birthday'],
            occupation: item['occupation'],
            img: item['img'],
            status: item['status'],
            appearance: item['appearance'],
            nickname: item['nickname'],
            portrayed: item['portrayed']));

        listActors.add(Post(
            char_Id: item['char_id'],
            name: item['name'],
            birthday: item['birthday'],
            occupation: item['occupation'],
            img: item['img'],
            status: item['status'],
            appearance: item['appearance'],
            nickname: item['nickname'],
            portrayed: item['portrayed']));
      }

      return actors;

      //print(jsonData);
    } else {
      throw Exception("Fallo la conexion");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listadoActors = fetchPost();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: Scaffold(
        appBar: MiAppBar(listActors),
        body: FutureBuilder(
          future: _listadoActors,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //print(snapshot.data);
              return ListView(
                children: _listActors(snapshot.data),
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('data');
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget> _listActors(data) {
    List<Widget> actors = [];

    for (var item in data) {
      actors.add(Card(
          child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: item.img,
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
        title: Text(item.name),
        subtitle: Text(item.portrayed),
      )));
    }

    return actors;
  }
}
