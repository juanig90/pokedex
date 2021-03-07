class PokemonDetail {
  final String name;

  PokemonDetail({this.name});

  factory PokemonDetail.fromJson(Map<String, dynamic> map) {
    print(map);
    return PokemonDetail(
      name: map['name'],
    );
  }
}
