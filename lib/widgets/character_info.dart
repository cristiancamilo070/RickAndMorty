import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/widgets/next_page.dart';
import 'package:rickandmorty/widgets/rounded_status.dart';
import 'character_info_card.dart';
import 'package:favorite_button/favorite_button.dart';


class CharacterInfo extends StatelessWidget {
  const CharacterInfo({Key? key, required this.characters, required this.url})
      : super(key: key);
  final List<CharacterModel> characters;
  final String url;

  @override
  Widget build(BuildContext context) {
    return charactertsAll(context, characters);
  }

  Widget charactertsAll(context, data) {
    return Scaffold(
      
        appBar: AppBar(
          title: const Text('Rick & Morty', style: TextStyle(color: Colors.white),),
          elevation: 3,
          centerTitle: true,
          backgroundColor: const Color(0xFF2F4368),
          actions: [
            NextPage(
              url: url,
              character: data,
            ),
          ],
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 580,
              childAspectRatio: 5 / 3,
            ),
            children: <Widget>[
              for (var i = 0; i < data.length; i++)
                infoCharacter(context, i, data)
            ]));
  }
}

Widget infoCharacter(context, i, data) {
  List<CharacterModel> characters = data;
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterInfoCard(
                      character: data,
                      index: i,
                    )));
      },
      child: FittedBox(
          child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 300, minWidth: 550),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color(0xFF2F4368).withOpacity(0.9),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(180)
                          ),
                          child: Image.network(
                            characters[i].image,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          characters[i].name,
                                          style: const TextStyle(
                                              fontSize: 29,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ),
                                        Row(children: [
                                          RoundedStatus(index: i, data: characters),
                                          Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Text(characters[i].status +' - ' +characters[i].species,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 23
                                                    ),
                                              ))
                                        ]),
                                          StarButton(valueChanged: (_isFavorite) {
                                            
                                            print('Is Favorite :'+characters[i].name+' $_isFavorite');
                                          } )
                                      ]
                                  ),
                                ]
                              )
                          )
                        ]
                      )
                    )
                  )
                ),
    ),
  );
}