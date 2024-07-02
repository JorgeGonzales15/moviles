import 'package:cocktail/dao/cocktail_dao.dart';
import 'package:flutter/material.dart';



class FavoriteCocktailListScreen extends StatefulWidget {
  const FavoriteCocktailListScreen({super.key});

  @override
  State<FavoriteCocktailListScreen> createState() => _FavoriteCocktailListScreenState();
}

class _FavoriteCocktailListScreenState extends State<FavoriteCocktailListScreen> {
  List _favoriteCharacters = [];

  initialize() async {
    _favoriteCharacters = await CocktailDao().fetchAll();
    if (mounted) {
      setState(() {
        _favoriteCharacters = _favoriteCharacters;
      });
    }
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _favoriteCharacters.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(_favoriteCharacters[index].name),
            
          ),
        ),
      ),
    );
  }
}