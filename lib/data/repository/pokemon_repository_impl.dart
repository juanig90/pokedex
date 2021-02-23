import 'package:flutter/widgets.dart';
import 'package:pokedex_app/data/source/pokemon_data_source.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({@required this.pokemonDataSource});

  @override
  Future<List<Pokemon>> getPokemons() => pokemonDataSource.getPokemons();
}
