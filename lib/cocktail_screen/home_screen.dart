import 'package:cocktail/cocktail_screen/favorites_screen.dart';
import 'package:cocktail/cocktail_screen/widgets/cocktail_list.dart';
import 'package:cocktail/cocktail_screen/widgets/custom_search_bar.dart';
import 'package:cocktail/models/cocktail.dart';
import 'package:cocktail/services/cocktail_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CocktailScreen extends StatefulWidget {
  const CocktailScreen({super.key});

  @override
  State<CocktailScreen> createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  List<Cocktail> cocktails = [];
  final CocktailService cocktailService = CocktailService();
  int cocktailsCount = 0;

  int _currentIndex = 0;  // Índice para el BottomNavigationBar

  final List<Widget> _tabs = [
    const CocktailsTab(),
    const FavoriteCocktailListScreen()
  ];

  Future<void> fetchCocktails(String value) async {
    if (value.isEmpty) {
      return;
    }

    try {
      List<Cocktail> result = await cocktailService.filterByName(value) as List<Cocktail>;
      setState(() {
        cocktails = result;
        cocktailsCount = result.length;
      });
      print("Cocktails fetched: ${cocktails.length}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('cocktails_count', cocktails.length);
    } catch (e) {
      print("Error fetching cocktails: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
      ),
      body: _tabs[_currentIndex],  // Muestra la pestaña correspondiente
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            label: 'Cocktails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

// Tab para la búsqueda de cócteles
class CocktailsTab extends StatefulWidget {
  const CocktailsTab({super.key});

  @override
  _CocktailsTabState createState() => _CocktailsTabState();
}

class _CocktailsTabState extends State<CocktailsTab> {
  List<Cocktail> cocktails = [];
  final CocktailService cocktailService = CocktailService();
  int cocktailsCount = 0;

  Future<void> fetchCocktails(String value) async {
    if (value.isEmpty) {
      return;
    }

    try {
      List<Cocktail> result = await cocktailService.filterByName(value) as List<Cocktail>;
      setState(() {
        cocktails = result;
        cocktailsCount = result.length;
      });
      print("Cocktails fetched: ${cocktails.length}");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('cocktails_count', cocktails.length);
    } catch (e) {
      print("Error fetching cocktails: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomSearchBar(
            callback: (value) {
              fetchCocktails(value);
            },
          ),
          const SizedBox(height: 20),
          Text('Number of results: $cocktailsCount'),
          const SizedBox(height: 15),
          Expanded(child: CocktailList(cocktails: cocktails))
        ],
      ),
    );
  }
}

/*class CocktailScreen extends StatefulWidget {
  const CocktailScreen({super.key});

  @override
  State<CocktailScreen> createState() => _CocktailScreenState();
}

class _CocktailScreenState extends State<CocktailScreen> {
  final List<Widget> _tabs = [
    const CocktailScreen(),
    const FavoriteCocktailListScreen()
  ];
  List<Cocktail> cocktails = [];
  final CocktailService superheroService = CocktailService();
  int cocktailsCount = 0;

  Future<void> fetchCocktails(String value) async {
    if (value.isEmpty) {
      return;
    }

    try {
      List<Cocktail> result =
          await superheroService.filterByName(value) as List<Cocktail>;
      setState(() {
        cocktails = result;
        // Actualizar heroesCount dentro de setState para asegurar la sincronización
        cocktailsCount = result.length;
      });
      print("Cocktails fetched: ${cocktails.length}");

      // Guardar la cantidad de elementos en shared_preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('cocktails_count', cocktails.length);
    } catch (e) {
      print("Error fetching cocktails: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cocktails'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomSearchBar(
              callback: (value) {
                fetchCocktails(value);
              },
            ),
            const SizedBox(height: 20),
            Text('Number of results: $cocktailsCount'),
            const SizedBox(height: 15),
            Expanded(child: CocktailList(cocktails: cocktails))
          ],
        ),
      ),
    );
  }
}*/