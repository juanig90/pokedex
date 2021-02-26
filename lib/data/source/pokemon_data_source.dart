import 'package:pokedex_app/domain/model/pokemon.dart';

abstract class PokemonDataSource {

  Future<List<Pokemon>> getPokemons();

}