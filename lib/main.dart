import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/pages/character_page.dart';
import 'package:rickandmorty/pages/home_page.dart';
import 'package:rickandmorty/pages/locations_page.dart';
import 'package:rickandmorty/services/ui_provider.dart';

void main() => runApp(const MyApp());
//final main so far


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_)=>UiProvider())
       ],
       child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'Rick and Morty',
        initialRoute: 'home',
        routes: {
          'home'  :(_)=>const HomePage(),
          'locations'   :(_)=>const LocationPage()
        },
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
         ),
     );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//      return MaterialApp(
//       debugShowCheckedModeBanner: false, 
//       title: 'Rick and Morty',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home:  const CharacterPage(),
//     );
//   }
// }