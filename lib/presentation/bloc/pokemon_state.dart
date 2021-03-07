import 'package:pokedex_app/domain/model/pokemon_detail.dart';

abstract class PokemonState {}

class Loading extends PokemonState {}

class Successful extends PokemonState {

  final PokemonDetail pokemon;

  Successful(this.pokemon);

}

class Error extends PokemonState {}