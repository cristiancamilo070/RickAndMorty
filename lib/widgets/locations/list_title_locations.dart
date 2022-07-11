import 'package:flutter/material.dart';

class ListTileLocationsWidget extends StatelessWidget {
  const ListTileLocationsWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.paddingI = 5,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final double paddingI;
  @override
  Widget build(BuildContext context) {
    return listTile(title, subtitle);
  }

  listTile(title, subtitle) {
    return Card(
      elevation: 4,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: paddingI, bottom: 2.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 23,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: paddingI, top: 2),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          )
        ]),
    );
    
  }
}