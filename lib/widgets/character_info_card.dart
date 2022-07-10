import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_model.dart';
import 'package:rickandmorty/widgets/rounded_status.dart';

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
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    character[index].name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: RoundedStatus(index: index, data: character),
                  ),
                ],
              ),
            ),
            backgroundColor: const Color(0xFF24282f),
            body: width < 600
                ? Center(
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: height, maxWidth: width),
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: const Color(0xFF3c3e44),
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: ClipOval(
                                        // borderRadius: const BorderRadius.all(
                                        //     Radius.circular(20)),
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
                                    ])))))
                : Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: const Color(0xFF3c3e44),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20)),
                            child: Image.network(character[index].image)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTileWidget(
                                    paddingI: 4,
                                    title: 'Status',
                                    subtitle: character[index].status),
                                ListTileWidget(
                                    paddingI: 4,
                                    title: 'Species',
                                    subtitle: character[index].species),
                                ListTileWidget(
                                  paddingI: 4,
                                  title: 'Gender',
                                  subtitle: character[index].gender,
                                ),
                              ]),
                        ),
                      ],
                    ))));
  }
}