import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../models/movies_model.dart';

class TopHeaderDetail extends StatefulWidget {
  final MoviesModel movieData;
  final Function toggleFavorite;
  final Function isLike;
  const TopHeaderDetail(
    this.movieData,
    this.toggleFavorite,
    this.isLike, {
    super.key,
  });

  static const routeName = '/top-header';

  @override
  State<TopHeaderDetail> createState() => _TopHeaderDetailState();
}

class _TopHeaderDetailState extends State<TopHeaderDetail> {
  int activeImage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 450.0,
            initialPage: activeImage,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeImage = index;
              });
            },
            viewportFraction: 1,
          ),
          items: widget.movieData.imgUrls.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        height: 450,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.5),
                    )
                  ],
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Available Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Watch ${widget.movieData.title}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.movieData.imgUrls.map((image) {
                  final imageIndex = widget.movieData.imgUrls.indexOf(image);
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: activeImage == imageIndex
                          ? Colors.blue
                          : Colors.white,
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 40,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                setState(() {
                  widget.toggleFavorite(widget.movieData.id);
                });
              },
              icon: Icon(
                widget.isLike(widget.movieData.id)
                    ? Icons.favorite
                    : Icons.favorite_border_rounded,
              ),
              color: Colors.white,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          left: 20,
          child: Text(
            'The Plot',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
