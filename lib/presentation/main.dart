import 'package:flutter/material.dart';
import 'package:pokedex_app/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_app/data/source/pokemon_data_source_impl.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case_impl.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/widget/pokemon_list_widget.dart';
import 'package:provider/provider.dart';

import 'bloc/pokemon_state.dart';

void main() {

  // ToDo This will be provided by get it

  final dataSource = PokemonDataSourceImpl();
  final repository = PokemonRepositoryImpl(pokemonDataSource: dataSource);
  final useCase = GetPokemonUseCaseImpl(repository);

  runApp(
    ChangeNotifierProvider(
      create: (context) => PokemonBloc(useCase),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<PokemonBloc>(context).fetchPokemons();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Pokedex'),
          ),
          body: Consumer<PokemonBloc>(
            builder: (context, bloc, child) {
              var state = bloc.state;
              if (state is Loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is Successful) {
                return PokemonListWidget(pokemons: state.pokemon);
              } else if (state is Error) {
                return Text(' Error');
              } else {
                return Text('Unknown error');
              }
            },
          )),
    );
  }
}
