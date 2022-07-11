import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/widgets/characters/rounded_status.dart';

import 'list_title.dart';

class CharacterInfoCard extends StatelessWidget {
  const CharacterInfoCard(
      {Key? key, required this.character, required this.index})
      : super(key: key);
  final List<CharacterModel> character;
  final int index;
  @override
  Widget build(BuildContext context) {
    return infoCharacter(context, index);
  }

  Widget infoCharacter(context, index) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Material(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF2F4368),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RoundedStatus(index: index, data: character),
                  ),
                  Text(
                    character[index].name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  
                ],
              ),
            ),
           // backgroundColor: const Color(0xFFBB9981).withOpacity(),
            body: Center(
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: height, maxWidth: width),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: const Color(0xFF2F4368).withOpacity(1),
                            child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: ClipOval(
                                        child: Image.network(
                                            character[index].image),
                                      )),
                                      ListTileWidget(
                                          title: 'Status',
                                          subtitle: character[index].status),
                                      ListTileWidget(
                                          title: 'Species',
                                          subtitle: character[index].species),
                                      ListTileWidget(
                                        title: 'Gender',
                                        subtitle: character[index].gender,
                                      ),
                                      ListTileWidget(
                                      title: 'Last known location:',
                                      subtitle: character[index].location.name),
                                  ListTileWidget(
                                      title: 'Origin',
                                      subtitle: character[index].origin.name)
                                    ])))))
                
                    ));
  }
}