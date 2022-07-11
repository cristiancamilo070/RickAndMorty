import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/widgets/bottom_navigation_bar.dart';
import 'package:rickandmorty/widgets/characters/character_info.dart';

int? index;

String url="https://rickandmortyapi.com/api/character";

Character? character;
//List<CharacterU>? characteru;

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);
 // HomePage({Key? key}) : super(key: key);
  @override
  State<CharacterPage> createState() => _CharacterPage();
}

class _CharacterPage extends State<CharacterPage> {

  Future<Character> requestCharacter() async {
    http.Response response;
    
    response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
        setState(() {
          final json = jsonDecode(response.body);
          character = Character.fromJson(json);
          //url=character!.info.next;
          } 
        );
    }
    return character!;
    }
  

  @override
  void initState() {
    print(requestCharacter());
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: character==null ?       
           Scaffold(
           appBar: AppBar(
          title: const Text('Cargando datos', style: TextStyle(color: Colors.white),),
          elevation: 3,
          centerTitle: true,
          backgroundColor: const Color(0xFF2F4368),
        ),
            body: Center(
              child: Image.asset(
                   'assets/rickmorty.jpg',
                    fit: BoxFit.contain,
                    height: 270,
                ),
            ))
           : 

            FutureBuilder (
              future: requestCharacter(),
              initialData: character,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return CharacterInfo(characters: character!.results, url: url);
                
              }
            ),
        ),
      ),
     // bottomNavigationBar:   const CustomNavigationBar(),
    );
    
  }
}