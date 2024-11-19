import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../screens/movie_details_screen.dart';
import '../screens/movie_categories_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Movies _moviesModel = Movies();
  final CategoriesMovie _categoriesList = CategoriesMovie();

  void toggleFavorites(String id) {
    setState(() {
      _moviesModel.toggleFavoritesItems(id);
    });
  }

  bool isLike(String id) {
    return _moviesModel.favorites.any((movie) => movie.id == id);
  }

  void _removeMovie(String id) {
    setState(() {
      _moviesModel.removeMovie(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(19, 22, 27, 2),
          unselectedItemColor: Color.fromRGBO(53, 57, 67, 2),
          selectedItemColor: Color.fromRGBO(69, 94, 108, 2),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(19, 22, 27, 2),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          centerTitle: true,
        ),
      ),
      initialRoute: TabScreen.routeName,
      routes: {
        TabScreen.routeName: (ctx) => TabScreen(
              moviesModel: _moviesModel,
              categoriesList: _categoriesList.categoriesList,
              toggleFavorites: toggleFavorites,
              isLike: isLike,
              removeMovie: _removeMovie,
            ),
        MovieDetailsScreen.routeName: (ctx) => const MovieDetailsScreen(),
        MovieCategoriesScreen.routeName: (ctx) => MovieCategoriesScreen(
            moviesModel: _moviesModel.list, removeMovie: _removeMovie),
        ChatScreen.routeName: (ctx) => const ChatScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
      },
    );
  }
}
