import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../screens/category_screens/movies_page.dart';
import '../screens/category_screens/my_list_page.dart';
import '../screens/category_screens/tv_show_page.dart';

class HomePage extends StatefulWidget {
  final Movies moviesModel;
  final List<CategoriesModel> categoriesList;
  final Function toggleFavorites;
  final Function isLike;
  const HomePage({
    required this.moviesModel,
    required this.categoriesList,
    required this.toggleFavorites,
    required this.isLike,
    super.key,
  });

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget presText(Function() handler, String title) {
    return TextButton(
      onPressed: handler,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  int activePage = 0;

  List<Map<String, dynamic>> _pages = [];

  @override
  void initState() {
    _pages = [
      {
        'title': "Movies",
        'page': MoviesPage(
          moviesModel: widget.moviesModel.list,
          categoriesList: widget.categoriesList,
          toggleFavorites: widget.toggleFavorites,
          isLike: widget.isLike,
        ),
      },
      {
        'title': "TV Shows",
        'page': const TvShowPage(),
      },
      {
        'title': "My List",
        'page': MyListPage(
          moviesModel: widget.moviesModel.list,
          favoriteMovie: widget.moviesModel.favorites,
          toggleFavorites: widget.toggleFavorites,
        ),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
                Row(
                  children: _pages.map((page) {
                    final indexPage = _pages.indexOf(page);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            activePage = indexPage;
                          });
                        },
                        child: Text(
                          page['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: activePage == indexPage
                                ? Colors.white
                                : const Color.fromRGBO(40, 43, 50, 2),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          _pages[activePage]['page'],
        ],
      ),
    );
  }
}
