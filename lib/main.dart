import 'package:flutter/material.dart';
import 'package:rickandmorty/pages/character_page.dart';
import 'package:rickandmorty/pages/locations_page.dart';

void main() => runApp(const MyApp());
//final main so far
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false, 
      title: 'Rick and Morty',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  CharacterPage(),
    );
  }
}