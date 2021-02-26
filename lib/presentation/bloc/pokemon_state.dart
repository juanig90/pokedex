import 'package:pokedex_app/domain/model/pokemon.dart';

abstract class PokemonState {}

class Loading extends PokemonState {}

class Successful extends PokemonState {

  final List<Pokemon> pokemon;

  Successful(this.pokemon);

}

class Error extends PokemonState {}