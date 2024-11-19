import 'package:flutter/material.dart';

import '../models/movies_model.dart';

class FavoriteCardItem extends StatefulWidget {
  final MoviesModel moviesModel;
  final Function toggleFavorites;
  const FavoriteCardItem(
    this.moviesModel,
    this.toggleFavorites, {
    super.key,
  });

  @override
  State<FavoriteCardItem> createState() => _FavoriteCardItemState();
}

class _FavoriteCardItemState extends State<FavoriteCardItem> {
  

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      color: const Color.fromRGBO(30, 36, 40, 2),
      child: ListTile(
        leading: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            widget.moviesModel.imgUrls[0],
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          widget.moviesModel.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(widget.moviesModel.companyName),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey.shade900,
          ),
          child: IconButton(
            onPressed: () {
              widget.toggleFavorites(widget.moviesModel.id);
            },
            icon: const Icon(Icons.favorite),
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
