import 'package:flutter/material.dart';

import '/models/categories_model.dart';
import '/models/movies_model.dart';

import '/widgets/categories.dart';
import '/widgets/header.dart';

class MoviesPage extends StatelessWidget {
  final List<MoviesModel> moviesModel;
  final List<CategoriesModel> categoriesList;
  final Function toggleFavorites;
  final Function isLike;
  const MoviesPage({
    required this.moviesModel,
    required this.categoriesList,
    required this.toggleFavorites,
    required this.isLike,
    super.key,
  });

  static const routeName = '/movies-page';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          moviesModel,
          toggleFavorites,
          isLike,
        ),
        const SizedBox(
          height: 20,
        ),
        Categories(
          moviesModel: moviesModel,
          categoriesList: categoriesList,
          toggleFavorites: toggleFavorites,
          isLike: isLike,
        ),
      ],
    );
  }
}
