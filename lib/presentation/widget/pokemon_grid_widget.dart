import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_app/domain/model/pokemon.dart';
import 'package:pokedex_app/presentation/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/injection_container.dart' as di;

class PokemonGridWidget extends StatefulWidget {

  final Function(Pokemon pokemon) onTap;

  PokemonGridWidget(this.onTap);

  @override
  State<StatefulWidget> createState() {
    return _PokemonGridState();
  }
}

class _PokemonGridState extends State<PokemonGridWidget> {
  static const _pageSize = 20;
  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);
  PokemonBloc bloc;

  @override
  void initState() {
    bloc = di.getIt<PokemonBloc>();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedGridView<int, Pokemon>(
      pagingController: _pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.height / 800),
      builderDelegate: PagedChildBuilderDelegate<Pokemon>(
        itemBuilder: (context, item, index) {
          return InkWell(
            onTap: () => widget.onTap(item),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.network(item.imageUrl),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                       item.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _fetchPage(int pageKey) async {
    try {
      final newItems = await bloc.getPokemons(pageKey: pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

}
