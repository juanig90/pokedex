import 'package:flutter/material.dart';
import 'package:pokedex_app/presentation/pages/pokemons_page.dart';
import 'package:pokedex_app/injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PokemonsPage()
    );
  }
}
