
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/pages/character_page.dart';
import 'package:rickandmorty/pages/locations_page.dart';
import 'package:rickandmorty/services/ui_provider.dart';
import 'package:rickandmorty/widgets/bottom_navigation_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body:  _HomePageBody(),
      bottomNavigationBar:   CustomNavigationBar(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Obtener el selected menu opt
    final uiProvider=Provider.of<UiProvider>(context);

    //This one needs to be the same in the 2 classes
    final currentIndex=uiProvider.selectedMenuOpt;
    switch (currentIndex) {
      case 0 : return const CharacterPage();
      case 1 : return const LocationPage();
      default: return const CharacterPage();
    }
  }
}