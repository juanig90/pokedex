class TypePokemon {

  final String name;

  TypePokemon({this.name});

  factory TypePokemon.fromJson(Map<String, dynamic> map) => TypePokemon(name: map['name']);

  static List<TypePokemon> parseJsonList(Iterable iterable) =>
      iterable.map((map) => TypePokemon(name: map['name'])).toList();

}