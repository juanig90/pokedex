import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';

class PokemonGridWidget extends StatelessWidget {
  final List<Pokemon> _pokemons;

  const PokemonGridWidget(this._pokemons, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5.0, crossAxisCount: 2),
        itemCount: _pokemons.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(_pokemons[index].imageUrl),
                ),
                Text(
                  _pokemons[index].name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          );
        });
  }
}