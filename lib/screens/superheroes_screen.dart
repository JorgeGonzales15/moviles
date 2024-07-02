import 'package:flutter/material.dart';
import 'package:supercomicsapp/models/superhero.dart';
import 'package:supercomicsapp/screens/widgets/custom_search_bar.dart';
import 'package:supercomicsapp/screens/widgets/superhero_list.dart';
import 'package:supercomicsapp/services/superhero_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuperheroesScreen extends StatefulWidget {
  const SuperheroesScreen({super.key});

  @override
  State<SuperheroesScreen> createState() => _SuperheroesScreenState();
}

class _SuperheroesScreenState extends State<SuperheroesScreen> {
  List<Superhero> superheroes = [];
  final SuperHeroService superheroService = SuperHeroService();
  int heroesCount = 0;

  Future<void> fetchHeroes(String value) async {
    if (value.isEmpty) {
      return;
    }

    try {
      List<Superhero> result =
          await superheroService.searchHeros(value) as List<Superhero>;
      setState(() {
        superheroes = result;
        // Actualizar heroesCount dentro de setState para asegurar la sincronización
        heroesCount = result.length;
      });
      print("Heroes fetched: ${superheroes.length}");

      // Guardar la cantidad de elementos en shared_preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('heroes_count', superheroes.length);
    } catch (e) {
      print("Error fetching heroes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Superheroes'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(
              callback: (value) {
                fetchHeroes(value);
              },
            ),
            const SizedBox(height: 20),
            Text('Number of results: $heroesCount'),
            const SizedBox(height: 15),
            Expanded(child: SuperheroList(superheroes: superheroes))
          ],
        ),
      ),
    );
  }
}
