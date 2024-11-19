import 'package:flutter/material.dart';

import '../models/movies_model.dart';

class MovieCategoriesScreen extends StatefulWidget {
  final List<MoviesModel> moviesModel;
  final Function removeMovie;
  const MovieCategoriesScreen(
      {required this.moviesModel, required this.removeMovie, super.key});

  static const routeName = '/movie-categories-screen';

  @override
  State<MovieCategoriesScreen> createState() => _MovieCategoriesScreenState();
}

class _MovieCategoriesScreenState extends State<MovieCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Movies'),
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) {
              return Card(
                color: const Color.fromRGBO(30, 36, 40, 2),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(widget.moviesModel[index].imgUrls[0]),
                  ),
                  title: Text(
                    widget.moviesModel[index].title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(widget.moviesModel[index].companyName),
                  // trailing: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       widget.removeMovie(widget.moviesModel[index].id);
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     Icons.delete_forever_rounded,
                  //     color: Colors.blue,
                  //   ),
                  // ),
                ),
              );
            },
            itemCount: widget.moviesModel.length,
          ),
        )
      ],
    );
  }
}
