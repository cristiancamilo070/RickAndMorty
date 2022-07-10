// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel characterModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String characterModelToJson(LocationModel data) => json.encode(data.toJson());

class Location {
    Location({
        required this.info,
        required this.results,
    });

    Info info;
    List<LocationModel> results;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        info: Info.fromJson(json["info"]),
        results: List<LocationModel>.from(json["results"].map((x) => LocationModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        required this.prev,
    });

    int count;
    int pages;
    String next;
    dynamic prev;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class LocationModel {
  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    // required this.created,
  });

  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  // DateTime created;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"] ?? 1000000,
        name: json["name"] ?? '',
        type: json["type"] ?? '',
        dimension: json["dimension"] ?? '',
        residents: List<String>.from(json["residents"] ?? [].map((x) => x)),
        url: json["url"] ?? '',
        // // created: DateTime.parse(json["created"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        // // "created": created.toIso8601String(),
      };
}