import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../models/movies_model.dart';

class TrailersDetail extends StatefulWidget {
  final List<MoviesModel> moviesModel;
  const TrailersDetail({required this.moviesModel, super.key});

  @override
  State<TrailersDetail> createState() => _TrailersDetailState();
}

class _TrailersDetailState extends State<TrailersDetail> {
  int activeImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              clipBehavior: Clip.none,
              height: 200,
              viewportFraction: 0.6,
              autoPlay: true,
              initialPage: activeImage,
              onPageChanged: (index, reason) {
                setState(() {
                  activeImage = index;
                });
              }),
          items: widget.moviesModel.map((movies) {
            return Builder(
              builder: (BuildContext context) {
                final ind = widget.moviesModel.indexOf(movies);
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: activeImage == ind
                          ? const EdgeInsets.only(top: 50)
                          : const EdgeInsets.all(20),
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                          movies.imgUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    activeImage == ind
                        ? Positioned(
                            bottom: -25,
                            right: 40,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Recommended',
          style: TextStyle(color: Colors.white),
        ),
        const Text(
          'Watch Trailers',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.moviesModel.map((movie) {
            final imageIndex = widget.moviesModel.indexOf(movie);
            return Container(
              margin: const EdgeInsets.all(7),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeImage == imageIndex
                    ? Colors.white
                    : Colors.grey.shade800,
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
