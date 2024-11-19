import 'package:flutter/material.dart';

class TvShowPage extends StatelessWidget {
  const TvShowPage({super.key});

  static const routeName = '/tv-show-page';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tv show',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
