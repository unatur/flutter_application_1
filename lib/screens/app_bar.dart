import 'package:flutter/material.dart';
import 'package:flutter_application_1/modelo/modelo.dart';
import 'package:flutter_application_1/screens/search_Actors_delegate.dart';

class MiAppBar extends StatelessWidget implements PreferredSizeWidget {
  //const MiAppBar({Key? key}) : super(key: key);
  List listadoActores;
  MiAppBar(this.listadoActores);

  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppBar(
      automaticallyImplyLeading: false,
      title: ListTile(
        onTap: () {
          showSearch(
              context: context, delegate: SearchActorsDelegate(listadoActores));
        },
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ));
  }
}
