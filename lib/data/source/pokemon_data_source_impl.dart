import 'dart:convert';
import 'package:pokedex_app/data/source/pokemon_data_source.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonDataSourceImpl implements PokemonDataSource {

  @override
  Future<List<Pokemon>> getPokemons() async {
    final response = await http.get('https://pokeapi.co/api/v2/pokemon');
    if (response.statusCode == 200) {
      var body = response.body;
      var jsonDecoded = jsonDecode(body);
      return Pokemon.parseJsonList(jsonDecoded['results']);
    } else
      throw Exception("Network error");
  }
}