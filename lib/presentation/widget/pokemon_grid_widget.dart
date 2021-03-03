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
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height / 800
        ),
        itemCount: _pokemons.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.network(_pokemons[index].imageUrl),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      _pokemons[index].name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
