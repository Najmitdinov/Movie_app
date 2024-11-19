import 'package:flutter/material.dart';

import '../widgets/top_header_detail.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  static const routeName = '/movie-details-screen';

  @override
  Widget build(BuildContext context) {
    final movieData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final movieDetails = movieData['movieModelSorted'];
    final toggleFavorite = movieData['toggleFavorite'];
    final isLike = movieData['isLike'];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 22, 27, 2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeaderDetail(
              movieDetails,
              toggleFavorite,
              isLike,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieDetails.description,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Director :',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Text(
                        ' ${movieDetails.director}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Writer :',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Text(
                        ' ${movieDetails.writers}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'The Cast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: movieDetails.actorsAndImages.isNotEmpty
                        ? ListView.builder(
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (ctx, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        movieDetails.actorsAndImages[index]
                                            ['actorImage'],
                                        fit: BoxFit.cover,
                                        height: 100,
                                        width: 110,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        movieDetails.actorsAndImages[index]
                                            ['actorName']!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: movieDetails.actorsAndImages.length,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
