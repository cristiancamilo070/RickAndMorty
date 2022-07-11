import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/widgets/locations/location_info.dart';


int? index;

String url="https://rickandmortyapi.com/api/location";

Location? location;

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

Future<Location> requestLocation() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
        setState(() {
          final json = jsonDecode(response.body);
          location = Location.fromJson(json);
          } 
        );
    }
    return location!;
    }

@override
  void initState() {
    print(requestLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: location==null           ?        
          Scaffold(
           appBar: AppBar(
          title: const Text('Cargando datos', style: TextStyle(color: Colors.white),),
          elevation: 3,
          centerTitle: true,
          backgroundColor: const Color(0xFF2F4368),
        ),
            body:Center(
                child: Image.asset(
                       'assets/rickmorty.jpg',
                        fit: BoxFit.contain,
                        height: 270,
                    ),
              ),
            
          )
          : 
            FutureBuilder (
              future: requestLocation(),
              initialData: location,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return LocationInfo(locations: location!.results, url: url);
                
              }
            ),
        ),
      ),
    );
  }
}