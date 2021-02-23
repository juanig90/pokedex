import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/repository/pokemon_repository.dart';

import 'get_pokemons_use_case.dart';

class GetPokemonUseCaseImpl implements GetPokemonsUseCase {

  final PokemonRepository pokemonRepository;


  GetPokemonUseCaseImpl(this.pokemonRepository);

  @override
  Future<List<Pokemon>> getPokemons() => pokemonRepository.getPokemons();
}