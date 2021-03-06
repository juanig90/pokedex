import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case.dart';

class PokemonBloc {
  final GetPokemonsUseCase _useCase;

  PokemonBloc(this._useCase);

  Future<List<Pokemon>> getPokemons({int pageKey = 0, int limit = 100}) async =>
      await _useCase.getPokemons(offset: pageKey, limit: limit);
}
