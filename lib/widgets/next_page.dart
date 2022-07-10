import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_model.dart';

import 'character_info.dart';

class NextPage extends StatelessWidget {
  const NextPage({
    Key? key,
    required this.character,
    required this.url,
  }) : super(key: key);

  final List<CharacterModel> character;
  final String url;

  @override
  Widget build(BuildContext context) {
    return nextButton(context);
  }

  nextButton(context) {
    return IconButton(
      tooltip: 'Siguiente Página',
      icon: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
      onPressed: () async {
        // final urlS = context.read<CharacterCubit>().getUrl();
        final response = await http.get(Uri.parse(url));
        final decodeCharacter = json.decode(response.body);
        final ulrUse = decodeCharacter['info']['next'];
        final character = decodeCharacter['results']
            .map<CharacterModel>((e) => CharacterModel.fromJson(e))
            .toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterInfo(
              url: ulrUse,
              characters: character,
            ),
          ),
        );
      },
    );
  }
  // Future<List<CharacterModel>> getLocation() async {
  //   final response = await http.get(Uri.parse(url));
  //   final owo = json.decode(response.body);
  //   return owo['results']
  //       .map<CharacterModel>((e) => CharacterModel.fromJson(e))
  //       .toList();
  // }
}