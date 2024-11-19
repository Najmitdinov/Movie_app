import 'package:flutter/material.dart';

class MoviesModel {
  final String id;
  final String title;
  final String subTitle;
  final String companyName;
  final List<String> imgUrls;
  final String description;
  final String director;
  final String writers;
  final List<Map<String, dynamic>> actorsAndImages;
  final double lengthStars;
  final String categoryId;

  MoviesModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.companyName,
    required this.imgUrls,
    required this.description,
    required this.director,
    required this.writers,
    required this.actorsAndImages,
    required this.lengthStars,
    required this.categoryId,
  });
}

class Movies {
  final List<MoviesModel> _list = [
    MoviesModel(
      id: UniqueKey().toString(),
      title: 'Joker',
      subTitle: 'Madness for two',
      companyName: 'DC movies',
      imgUrls: [
        'assets/images/joker1.jpg',
        'assets/images/joker2.jpg',
        'assets/images/joker3.jpg',
        'assets/images/joker4.jpg',
      ],
      description:
          'Gotham, early 1980s. Comedian Arthur Fleck lives with his sick mother, who has taught him to "walk with a smile" since childhood. Trying to bring good to the world and give people joy, Arthur encounters human cruelty and gradually comes to the conclusion that this world will receive from him not a kind smile, but the grin of the villainous Joker.',
      director: 'Todd Phillips',
      writers: 'Todd Phillips , Scott Silver',
      actorsAndImages: [
        {
          'actorName': 'Joaquin Phoenix',
          'actorImage': 'assets/images/actor1.jpg',
        },
        {
          'actorName': 'Robert De Niro',
          'actorImage': 'assets/images/actor2.jpg'
        }
      ],
      lengthStars: 5,
      categoryId: 'c2',
    ),
    MoviesModel(
      id: UniqueKey().toString(),
      title: 'Venom',
      subTitle: 'Last Dance',
      companyName: 'Marvel movies',
      imgUrls: [
        'assets/images/venom1.jpg',
        'assets/images/venom.jpg',
        'assets/images/venom2.jpg',
        'assets/images/venom3.jpg',
      ],
      description:
          'Venom: The Last Dance is an American superhero film based on the Marvel Comics novel Venom, directed by Kelly Marcel and co-written by her and Tom Hardy; a sequel to Venom and Venom 2, the final installment in the Venom trilogy, and the fifth film in the Venom Universe media franchise',
      director: 'Kelly Marcel',
      writers: 'Dan Deacon',
      actorsAndImages: [
        {
          'actorName': 'Tom Hardy',
          'actorImage': 'assets/images/tomhardy.jpg',
        },
      ],
      lengthStars: 4,
      categoryId: 'c3',
    ),
    MoviesModel(
      id: UniqueKey().toString(),
      title: 'The Avengers',
      subTitle: 'Final',
      companyName: 'Marvel movies',
      imgUrls: ['assets/images/avangers.jpg', 'assets/images/avangers1.jpg'],
      description:
          'The remaining members of the Avengers team and their allies must devise a new plan to counter the destructive actions of the powerful Titan Thanos. After the largest and most tragic battle in history, they cannot afford to make a mistake.',
      director: 'Anthony Russo , Joe Russo',
      writers: 'Matthew Schmidt , Jeffrey Ford',
      actorsAndImages: [
        {
          'actorName': 'Robert Downey Jr',
          'actorImage': 'assets/images/ironman.jpg',
        },
        {
          'actorName': 'Chris Evans',
          'actorImage': 'assets/images/capitan.jpg',
        },
        {
          'actorName': 'Scarlett Johansson',
          'actorImage': 'assets/images/blackwidow.jpg',
        },
        {
          'actorName': 'Chris Hemsworth',
          'actorImage': 'assets/images/thor.jpg',
        },
      ],
      lengthStars: 3.5,
      categoryId: 'c3',
    ),
    MoviesModel(
      id: UniqueKey().toString(),
      title: 'It chapter two',
      subTitle: '',
      companyName: 'New Line Cinema',
      imgUrls: [
        'assets/images/it.jpg',
        'assets/images/it1.jpg',
        'assets/images/it2.jpg'
      ],
      description:
          '27 years have passed since the boys first encountered the demonic Pennywise. They have grown up and each has their own life. But suddenly their peaceful existence is disrupted by a strange phone call that forces them to get together again.',
      director: 'Andres Muschietti',
      writers: 'Stephen King',
      actorsAndImages: [
        {
          'actorName': 'Bill Skarsgard',
          'actorImage': 'assets/images/bill.jpg',
        },
      ],
      lengthStars: 6,
      categoryId: 'c4',
    ),
    MoviesModel(
      id: UniqueKey().toString(),
      title: 'Smile',
      subTitle: '',
      companyName: 'Paramount Pictures',
      imgUrls: [
        'assets/images/smile.jpg',
        'assets/images/smile1.jpg',
      ],
      description:
          'Rose Cotter works in the psychiatric emergency department and one day encounters a seemingly typical patient - a student who witnessed the suicide of a teacher a few days ago. The girl, in a hysterical state, claims that she is sane and is being persecuted of some evil entity. And then, with a terrible smile, she cuts her own throat. From that moment on, Rose begins to see the smiling suicide in the most inappropriate places, and her life gradually falls apart.',
      director: 'Parker Finn',
      writers: 'Stephen King',
      actorsAndImages: [
        {
          'actorName': 'Sosie Bacon',
          'actorImage': 'assets/images/smileactor.jpg',
        },
      ],
      lengthStars: 5,
      categoryId: 'c4',
    ),
  ];

  final List<MoviesModel> _favorites = [];

  void toggleFavoritesItems(String id) {
    final indexFavorites = _favorites.indexWhere((movie) => movie.id == id);
    if (indexFavorites < 0) {
      _favorites.insert(0, _list.firstWhere((movie) => movie.id == id));
    } else {
      _favorites.removeWhere((movie) => movie.id == id);
    }
  }

  void removeMovie(String id) {
    _list.removeWhere((movie) => movie.id == id);
  }

  List<MoviesModel> get list {
    return _list;
  }

  List<MoviesModel> get favorites {
    return _favorites;
  }
}
