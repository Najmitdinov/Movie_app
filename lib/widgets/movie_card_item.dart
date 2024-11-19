import 'package:flutter/material.dart';

import 'package:rating_bar_flutter/rating_bar_flutter.dart';

import '../models/movies_model.dart';

import '../screens/movie_details_screen.dart';

class MovieCardItem extends StatelessWidget {
  final MoviesModel movieModelSorted;
  final Function toggleFavorites;
  final Function isLike;
  const MovieCardItem({
    required this.movieModelSorted,
    required this.toggleFavorites,
    required this.isLike,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              MovieDetailsScreen.routeName,
              arguments: {
                'movieModelSorted': movieModelSorted,
                'toggleFavorite': toggleFavorites,
                'isLike': isLike,
              },
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  movieModelSorted.imgUrls[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 130,
                ),
              ),
              Flexible(
                child: Text(
                  movieModelSorted.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Flexible(
                child: Text(
                  movieModelSorted.companyName,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ),
              RatingBarFlutter(
                maxRating: 5,
                onRatingChanged: (value) {},
                initialRating: movieModelSorted.lengthStars,
                isHalfAllowed: true,
                halfFilledIcon: Icons.star_half_rounded,
                size: 20,
                filledColor: Colors.blue,
                halfFilledColor: Colors.blue,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
