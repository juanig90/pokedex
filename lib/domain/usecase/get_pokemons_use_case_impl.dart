import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/model/pokemon_detail.dart';
import 'package:pokedex_app/domain/repository/pokemon_repository.dart';

import 'get_pokemons_use_case.dart';

class GetPokemonUseCaseImpl implements GetPokemonsUseCase {

  final PokemonRepository pokemonRepository;


  GetPokemonUseCaseImpl(this.pokemonRepository);

  @override
  Future<List<Pokemon>> getPokemons({offset = 0, limit = 100}) => pokemonRepository.getPokemons(offset: offset, limit: limit);

  @override
  Future<PokemonDetail> getPokemon({String name}) => pokemonRepository.getPokemon(name: name);
}