import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';

class DetailPokemonPage extends StatelessWidget {
  final Pokemon _pokemon;

  DetailPokemonPage(this._pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          flexibleSpace: Hero(
            tag: "pokemon",
            child: Image.network(_pokemon.imageUrl),
          ),
        ),
        body: Text(''));
  }
}
