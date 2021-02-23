import 'package:pokedex_app/domain/model/pokemon.dart';

abstract class PokemonRepository {

  Future<List<Pokemon>> getPokemons();

}