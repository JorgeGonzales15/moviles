import 'package:flutter/material.dart';
import 'package:supercomicsapp/dao/superhero_dao.dart';
import 'package:supercomicsapp/models/superhero.dart';
import 'package:supercomicsapp/screens/widgets/superhero_list.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Superhero> superheroes = [];
  final SuperheroDao _superheroDao = SuperheroDao();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    try {
      List<Superhero> results = await _superheroDao.getAll();

      if (mounted) {
        setState(() {
          superheroes = results;
        });
      }
      print("Heroes fetched: $results");
    } catch (e) {
      print("Error fetching heroes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Center(
        child: Column(
          children: [Expanded(child: SuperheroList(superheroes: superheroes))],
        ),
      ),
    );
  }
}
