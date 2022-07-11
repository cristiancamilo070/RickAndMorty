import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/widgets/rounded_status.dart';

import 'list_title.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: RoundedStatus(index: index, data: location),
                  ),
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
                                        child: Text(location[index].name),
                                      )),
                                      ListTileWidget(
                                          title: 'Id:',
                                          subtitle: location[index].id.toString()),
                                      ListTileWidget(
                                          title: 'Type: ',
                                          subtitle: location[index].type),
                                      ListTileWidget(
                                        title: 'Gender',
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