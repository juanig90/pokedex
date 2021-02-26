import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';

class PokemonListWidget extends StatelessWidget {

  final List<Pokemon> pokemons;

  const PokemonListWidget({Key key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return ListView.builder(
       itemCount: pokemons.length,
       itemBuilder: (context, index) {
         return Text(pokemons[index].name);
       },
     );
  }

}