import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/widgets/characters/rounded_status.dart';

import '../characters/list_title.dart';

class LocationInfoCard extends StatelessWidget {
  const LocationInfoCard(
      {Key? key, required this.location, required this.index})
      : super(key: key);
  final List<LocationModel> location;
  final int index;
  @override
  Widget build(BuildContext context) {
    return infoLocation(context, index);
  }

  Widget infoLocation(context, index) {
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
                  Text(
                    location[index].name,
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
                          child: Container(
                            width: 250.0,
                            height: 250.0,
                            color: Colors.white,
                            child: Center(
                            child: Text("Id: "+location[index].id.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              ),
                             )
                            ),
                          ),
                        ),
                      ),
                    ListTileWidget(
                        title: 'Name:',
                        subtitle: location[index].name),
                    ListTileWidget(
                        title: 'Type: ',
                        subtitle: location[index].type),
                    ListTileWidget(
                      title: 'Dimension:',
                      subtitle: location[index].dimension,
                    ),
                                     
                    ]
                    )
                  )
                )
              )
            )
                
                    ));
  }
}