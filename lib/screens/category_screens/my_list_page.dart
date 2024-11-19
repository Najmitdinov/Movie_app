import 'package:flutter/material.dart';

import '/models/movies_model.dart';

import '/widgets/favorite_card_item.dart';

import '/widgets/trailers_detail.dart';

class MyListPage extends StatefulWidget {
  final List<MoviesModel> moviesModel;
  final List<MoviesModel> favoriteMovie;
  final Function toggleFavorites;
  const MyListPage({
    required this.moviesModel,
    required this.favoriteMovie,
    required this.toggleFavorites,
    super.key,
  });

  static const routeName = '/my-list-page';

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  void _toggleFavorite(String id) {
    setState(() {
      widget.toggleFavorites(id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Movie is disliked'),
        action: SnackBarAction(
          label: 'CANCEL',
          textColor: Colors.blue,
          onPressed: () {
            setState(() {
              widget.toggleFavorites(id);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TrailersDetail(moviesModel: widget.moviesModel),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: widget.favoriteMovie.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (ctx, index) {
                      return FavoriteCardItem(
                        widget.favoriteMovie[index],
                        _toggleFavorite,
                      );
                    },
                    itemCount: widget.favoriteMovie.length,
                  )
                : const Center(
                    child: Text(
                      'Add Favorite Movie',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
