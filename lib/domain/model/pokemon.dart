import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final String url;

  Pokemon({
    @required this.name,
    @required this.url,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
      return Pokemon(
        name: json['name'],
        url: json['url']
      );
  }

  static List<Pokemon> parseJsonList(Iterable list) {
     return list.map((e) => Pokemon.fromJson(e)).toList();
  }

  String get imageUrl {
    var imageBaseUrl = "https://pokeres.bastionbot.org/images/pokemon/";
    var id = url.split("/").reversed.skip(1).first;
    var imageUrl = "$imageBaseUrl$id.png";
    return imageUrl;
  }

}
