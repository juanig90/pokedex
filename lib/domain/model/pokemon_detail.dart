import 'package:pokedex_app/domain/model/type_pokemon.dart';

class PokemonDetail {
  final String name;
  final List<TypePokemon> types;

  PokemonDetail({this.name, this.types});

  factory PokemonDetail.fromJson(Map<String, dynamic> map) {
    return PokemonDetail(
      name: map['name'],
      types: TypePokemon.parseJsonList(map['types'])
    );
  }
}
