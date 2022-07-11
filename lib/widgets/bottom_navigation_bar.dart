// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/services/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final uiProvider=Provider.of<UiProvider>(context);
    final currentIndex=uiProvider.selectedMenuOpt;
    
    return BottomNavigationBar(
      onTap: (int i)=>uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:Icon(Icons.person),
          label: 'Characters'
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.map_rounded),
          label: 'Locations'
        )
      ],
    );
  }
}