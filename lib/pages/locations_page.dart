import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/widgets/location_info.dart';


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
          child: location==null           ?        const Text("Data is loading"): 
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