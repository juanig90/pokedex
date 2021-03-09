import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_state.dart';
import 'package:pokedex_app/presentation/widget/rounded_container_widget.dart';
import 'package:provider/provider.dart';
import 'stat_widget.dart';

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
          final Successful successfulState = bloc.state;
          final pokemonDetail = successfulState.pokemon;
          return Container(
            color: Colors.black12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Text(
                      pokemonDetail.name,
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 2.0),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemonDetail.types
                          .map((e) => RoundedContainerWidget(e.name))
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Base Stats',
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 1.5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatWidget('HP'),
                        StatWidget('ATK'),
                        StatWidget('DEF'),
                        StatWidget('SPD'),
                        StatWidget('EXP'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text('Unknown');
        }
      },
    );
  }
}
