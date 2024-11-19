import 'package:flutter/material.dart';

import '../models/categories_model.dart';
import '../models/movies_model.dart';

import '../screens/chat_screen.dart';
import '../screens/home_page.dart';
import '../screens/movie_categories_screen.dart';
import '../screens/profile_screen.dart';

class TabScreen extends StatefulWidget {
  final Movies moviesModel;
  final List<CategoriesModel> categoriesList;
  final Function toggleFavorites;
  final Function isLike;
  final Function removeMovie;
  const TabScreen({
    required this.moviesModel,
    required this.categoriesList,
    required this.toggleFavorites,
    required this.isLike,
    required this.removeMovie,
    super.key,
  });

  static const routeName = 'tab-screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  BottomNavigationBarItem barWidget(Color color, IconData icon, label) {
    return BottomNavigationBarItem(
      backgroundColor: color,
      icon: Icon(icon),
      label: label,
    );
  }

  int activeScreen = 0;

  List<Widget> _screens = [];

  @override
  void initState() {
    _screens = [
      HomePage(
        moviesModel: widget.moviesModel,
        categoriesList: widget.categoriesList,
        toggleFavorites: widget.toggleFavorites,
        isLike: widget.isLike,
      ),
      MovieCategoriesScreen(
        moviesModel: widget.moviesModel.list,
        removeMovie: widget.removeMovie,
      ),
      const ChatScreen(),
      const ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 22, 27, 2),
      body: SingleChildScrollView(
        child: _screens[activeScreen],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeScreen,
        type: BottomNavigationBarType.shifting,
        items: [
          barWidget(
            const Color.fromRGBO(19, 22, 27, 2),
            Icons.home,
            'Home',
          ),
          barWidget(
            const Color.fromRGBO(19, 22, 27, 2),
            Icons.tv,
            'Categories',
          ),
          barWidget(
            const Color.fromRGBO(19, 22, 27, 2),
            Icons.chat_bubble_outline,
            'Chat',
          ),
          barWidget(
            const Color.fromRGBO(19, 22, 27, 2),
            Icons.person_2_outlined,
            'Profile',
          ),
        ],
        onTap: (value) {
          setState(() {
            activeScreen = value;
          });
        },
      ),
    );
  }
}
