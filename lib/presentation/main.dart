import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/widget/pokemon_grid_widget.dart';
import 'package:provider/provider.dart';
import 'bloc/pokemon_state.dart';
import 'package:pokedex_app/injection_container.dart' as di;

void main() {
  di.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => di.getIt<PokemonBloc>(),
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
                return PokemonGridWidget(state.pokemon);
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
