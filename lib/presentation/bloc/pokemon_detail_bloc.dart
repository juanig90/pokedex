import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/usecase/get_pokemons_use_case.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_state.dart';

class PokemonDetailBloc extends ChangeNotifier {

  GetPokemonsUseCase _useCase;
  PokemonState _state = Loading();

  PokemonDetailBloc(this._useCase);

  get state => _state;

  getPokemon(String name) async {
    _state = Loading();
    notifyListeners();
    try {
      final pokemon = await _useCase.getPokemon(name: name);
      _state = Successful(pokemon);
    } catch(e) {
      _state = Error();
    }
    notifyListeners();
  }

}