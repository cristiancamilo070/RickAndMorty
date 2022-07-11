import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';

import 'package:rickandmorty/widgets/locations/location_info_card.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:rickandmorty/widgets/locations/next_page_locations.dart';
import 'dart:math' as math;

class LocationInfo extends StatelessWidget {
  const LocationInfo({Key? key, required this.locations, required this.url })
      : super(key: key);
  final List<LocationModel> locations;
  final String url;

  @override
  Widget build(BuildContext context) {
    return locationsAll(context, locations);
  }

  Widget locationsAll(context, data) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rick & Morty', style: TextStyle(color: Colors.white),),
          elevation: 3,
          centerTitle: true,
          backgroundColor: const Color(0xFF2F4368),
          actions: [
            NextPageLocations(
              url: url,
              location: data,
            ),
          ],
        ),
        body: GridView(

            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480,
              childAspectRatio: 3,
              crossAxisSpacing: 60,
            ),
            children: <Widget>[
              for (var i = 0; i < data.length; i++)
                infoLocationA(context, i, data)
            ]));
  }
}

Widget infoLocationA(context, i, data) {
  List<LocationModel> locations = data;
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
           context,    _transitionSlide(context,i,data));
            // MaterialPageRoute(
            //     builder: (context) => LocationInfoCard(
            //           location: data,
            //           index: i,
            //         )));
      },
      child: FittedBox(
          child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100, minWidth: 550),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: const Color(0xFF2F4368).withOpacity(0.9),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        ClipOval(
                          child: Container(
                            width: 250.0,
                            height: 140.0,
                            color:  Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.9),
                            child: Center(
                            child: Text(locations[i].id.toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              ),
                              
                            )
                            ),
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
                                        Text(locations[i].name,
                                          style: const TextStyle(
                                              fontSize: 29,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          locations[i].type,
                                          style: const TextStyle(
                                              fontSize: 21,
                                              color: Colors.white,
                                              ),
                                        ),

                                          Padding(padding: const EdgeInsets.all(1.0),
                                          child: Row(
                                            children: [
                                              const Divider(
                                                indent: 30, //spacing at the start of divider
                                                endIndent: 1, //spacing at the end of divider
                                              ),
                                              const Icon(Icons.remove_red_eye_outlined,size: 70,color: Colors.white,),

                                              const Divider(
                                                indent: 1, //spacing at the start of divider
                                                endIndent: 30, //spacing at the end of divider
                                              ),
                                              StarButton(valueChanged: (_isFavorite) {
                                                print('Is Favorite :'+locations[i].name+' $_isFavorite');
                                                },
                                                iconSize: 150,
                                                iconDisabledColor: Colors.white,
                                              )
                                            ],

                                          ),),
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

Route _transitionSlide(context, i, data) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LocationInfoCard(
                      location: data,
                      index: i,
                    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
 
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
 
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}