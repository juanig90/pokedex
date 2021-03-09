import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/injection_container.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/widget/detail_widget.dart';
import 'package:provider/provider.dart';

class DetailPokemonPage extends StatelessWidget {
  final Pokemon _pokemon;

  DetailPokemonPage(this._pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        leading: Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () =>  Navigator.pop(context),
          ),
        ),
        flexibleSpace: Hero(
          tag: "pokemon",
          child: Image.network(_pokemon.imageUrl),
        ),
      ),
      body: ChangeNotifierProvider<PokemonDetailBloc>(
        create: (context) => getIt<PokemonDetailBloc>(),
        child: DetailWidget(_pokemon),
      ),
    );
  }
}
