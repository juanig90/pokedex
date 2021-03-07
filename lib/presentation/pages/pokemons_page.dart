import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/pages/detail_pokemon_page.dart';
import 'package:pokedex_app/presentation/widget/pokemon_grid_widget.dart';

class PokemonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: PokemonGridWidget(
        (pokemon) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPokemonPage(pokemon),
            ),
          );
        },
      ),
    );
  }
}
