import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../models/movies_model.dart';

import '../screens/movie_details_screen.dart';

class Header extends StatefulWidget {
  final List<MoviesModel> moviesModel;
  final Function toggleFavorites;
  final Function isLike;
  const Header(this.moviesModel, this.toggleFavorites, this.isLike,
      {super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  TextStyle texstyle() {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    );
  }

  int activeImage = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 0.9,
        clipBehavior: Clip.none,
        initialPage: activeImage,
        onPageChanged: (index, reason) {
          setState(() {
            activeImage = index;
          });
        },
      ),
      items: widget.moviesModel.map((movies) {
        return Builder(
          builder: (BuildContext context) {
            final imageIndex = widget.moviesModel.indexOf(movies);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MovieDetailsScreen.routeName,
                        arguments: {
                          'movieModelSorted': movies,
                          'toggleFavorite': widget.toggleFavorites,
                          'isLike': widget.isLike,
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [
                          Image.asset(
                            movies.imgUrls[1],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.5),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${movies.title}: ${movies.subTitle}',
                          style: texstyle(),
                        ),
                        Text(
                          movies.companyName,
                          style: texstyle(),
                        ),
                      ],
                    ),
                  ),
                  activeImage == imageIndex
                      ? Positioned(
                          right: 20,
                          bottom: -25,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
