import 'package:flutter/material.dart';
import 'package:supercomicsapp/screens/favorites_screen.dart';
import 'package:supercomicsapp/screens/superheroes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SuperComicsApp'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://i.pinimg.com/736x/5e/b0/d8/5eb0d854dc80503583400233f6b4d3c5.jpg',
                width: 200,
                height: 200),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuperheroesScreen()));
                },
                child: const Text('Superheroes'),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoritesScreen()));
                  },
                  child: const Text('Favorites'),
                ))
          ],
        )));
  }
}
