import 'package:pokedex_app/domain/model/pokemon.dart';

abstract class GetPokemonsUseCase {

  Future<List<Pokemon>> getPokemons({offset = 0, limit = 100});
}