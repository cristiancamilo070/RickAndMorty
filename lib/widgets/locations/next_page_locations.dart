import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/widgets/locations/location_info.dart';

class NextPageLocations extends StatelessWidget {
  const NextPageLocations({
    Key? key,
    required this.location,
    required this.url,
  }) : super(key: key);

  final List<LocationModel> location;
  final String url;

  @override
  Widget build(BuildContext context) {
    return nextButton(context);
  }

  nextButton(context) {
    return IconButton(
      tooltip: 'Siguiente Página',
      icon: const Icon(
        Icons.arrow_forward_sharp,
        color: Colors.white,
      ),
      onPressed: () async {
        // final urlS = context.read<CharacterCubit>().getUrl();
        final response = await http.get(Uri.parse(url));
        final decodeLocation = json.decode(response.body);
        final ulrUse = decodeLocation['info']['next'];
        final character = decodeLocation['results']
            .map<LocationModel>((e) => LocationModel.fromJson(e))
            .toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationInfo(
              url: ulrUse,
              locations: character,
            ),
          ),
        );
      },
    );
  }
}