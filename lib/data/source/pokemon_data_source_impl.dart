import 'package:pokedex_app/data/source/pokemon_data_source.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';

class PokemonDataSourceImpl implements PokemonDataSource {

  @override
  Future<List<Pokemon>> getPokemons() {
    return Future.value([
      Pokemon(
        id: "#001",
        name: "Bulbasaur",
        imageUrl:
        "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
      ),
      Pokemon(
        id: "#002",
        name: "Ivysaur",
        imageUrl:
        "https://assets.pokemon.com/assets/cms2/img/pokedex/full/002.png",
      )
    ]);
  }

}