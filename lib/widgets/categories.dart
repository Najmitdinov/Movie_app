import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../widgets/movie_card_item.dart';

class Categories extends StatelessWidget {
  final List<MoviesModel> moviesModel;
  final List<CategoriesModel> categoriesList;
  final Function toggleFavorites;
  final Function isLike;
  const Categories({
    required this.moviesModel,
    required this.categoriesList,
    required this.toggleFavorites,
    required this.isLike,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: categoriesList.map((category) {
          final movieModelSorted = moviesModel
              .where((movie) => movie.categoryId == category.id)
              .toList();
          return movieModelSorted.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return MovieCardItem(
                            movieModelSorted: movieModelSorted[index],
                            toggleFavorites: toggleFavorites,
                            isLike: isLike,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: movieModelSorted.length,
                      ),
                    )
                  ],
                )
              : Container();
        }).toList(),
      ),
    );
  }
}
