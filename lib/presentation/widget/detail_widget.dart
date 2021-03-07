import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_state.dart';
import 'package:provider/provider.dart';

class DetailWidget extends StatefulWidget {
  final Pokemon _pokemon;

  DetailWidget(this._pokemon);

  @override
  State<StatefulWidget> createState() => _DetailState();
}

class _DetailState extends State<DetailWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PokemonDetailBloc>(context, listen: false)
          .getPokemon(widget._pokemon.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonDetailBloc>(
      builder: (context, bloc, child) {
        print('Consumer ${bloc.state}');
        if (bloc.state is Loading)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (bloc.state is Successful) {
          return Text('Successful');
        } else {
          return Text('Unknown');
        }
      },
    );
  }
}
