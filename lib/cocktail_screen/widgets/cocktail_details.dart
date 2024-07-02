import 'package:flutter/material.dart';
import 'package:cocktail/models/cocktail.dart';

class CocktailDetail extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailDetail({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail.strDrink),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Image.network(cocktail.strDrinkThumb),
            const SizedBox(height: 16),
            Text(
              cocktail.strDrink,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              cocktail.strCategory,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              cocktail.strInstructions,
              style: const TextStyle(fontSize: 16),
            ),
          ],
          
        ),
      ),
    );
  }
}