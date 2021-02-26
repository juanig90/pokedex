import 'package:flutter/widgets.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_state.dart';
import 'pokemon_state.dart';

class PokemonBloc extends ChangeNotifier {
  final GetPokemonsUseCase _useCase;
  PokemonState state = Loading();

  PokemonBloc(this._useCase);

  void fetchPokemons() async {
    final pokemons = await _useCase.getPokemons();
    state = Successful(pokemons);
    notifyListeners();
  }
}
