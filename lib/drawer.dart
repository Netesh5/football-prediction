import 'package:flutter/material.dart';

Color textcolor = const Color(0xff838489);
Widget draweritem() {
  return Drawer(
    backgroundColor: const Color(0xff050810),
    child: ListView(children: [
      ListTile(
        leading: Icon(
          Icons.home,
          color: textcolor,
        ),
        title: const Text("Home"),
        // onTap: () {

        // },
      ),
      ListTile(
        leading: Icon(Icons.home, color: textcolor),
        title: const Text("Home"),
      ),
      ListTile(
        leading: Icon(Icons.home, color: textcolor),
        title: const Text("Home"),
      ),
      ListTile(
        leading: Icon(Icons.home, color: textcolor),
        title: const Text("Home"),
      ),
      ListTile(
        leading: Icon(Icons.home, color: textcolor),
        title: const Text("Home"),
      ),
    ]),
  );
}
