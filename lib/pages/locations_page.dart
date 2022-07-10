import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rickandmorty/models/location_model.dart';

Location? location;
int? index;

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

Future<Location> requestLocation() async {
    http.Response response;
    response = await http.get(Uri.parse("https://rickandmortyapi.com/api/location"));
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes de Rick y Morty'),
      ),
      body: Center(
        child: Container(
          child: location==null           ?        const Text("Data is loading"): 
            FutureBuilder (
              future: requestLocation(),
              initialData: location,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return ListView.builder (
                  itemCount: location!.results.length,
                  itemBuilder: (BuildContext context, int index){

                    return Card(
                      child: ListTile(
                        title:Text(location!.results[index].name.toString()),
                        subtitle: Text(location!.results[index].dimension.toString()),
                      ),
                    );
                  },
                );
              }
            ),
        ),
      ),
    );
  }
}