import 'package:get_it/get_it.dart';
import 'package:pokedex_app/data/repository/pokemon_repository_impl.dart';
import 'package:pokedex_app/data/source/pokemon_data_source.dart';
import 'package:pokedex_app/data/source/pokemon_data_source_impl.dart';
import 'package:pokedex_app/domain/repository/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case_impl.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_bloc.dart';

final getIt = GetIt.instance;

void init() {

  getIt.registerFactory(() => PokemonBloc(getIt()));

  getIt.registerLazySingleton<GetPokemonsUseCase>(() => GetPokemonUseCaseImpl(getIt()));

  getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(getIt()));

  getIt.registerLazySingleton<PokemonDataSource>(() => PokemonDataSourceImpl());
}