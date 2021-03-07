import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/widget/pokemon_grid_widget.dart';

class PokemonsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: PokemonGridWidget(),
    );
  }
}
