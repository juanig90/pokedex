import 'package:pokedex_app/data/source/pokemon_data_source.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/model/pokemon_detail.dart';
import 'package:pokedex_app/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl(this.pokemonDataSource);

  @override
  Future<List<Pokemon>> getPokemons({offset = 0 , limit = 100}) => pokemonDataSource.getPokemons(offset: offset, limit: limit);

  @override
  Future<PokemonDetail> getPokemon({String name}) => pokemonDataSource.getPokemon(name);
}
