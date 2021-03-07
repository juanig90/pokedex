import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/model/pokemon_detail.dart';

abstract class PokemonDataSource {

  Future<List<Pokemon>> getPokemons({offset = 0, limit = 100});
  Future<PokemonDetail> getPokemon(String name);

}