import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<Pokemon> pokemons;

  const PokemonGridWidget({Key key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(pokemons.length, (index) {
        return Center(
          child: Column(
            children: [
              Expanded(
                child: Image.network(pokemons[index].imageUrl),
              ),
              Text(
                pokemons[index].name,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        );
      }),
    );
  }
}