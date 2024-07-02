import 'package:flutter/material.dart';
import 'package:rick_morty_app/dao/character_dao.dart';


class FavoriteCharacterListScreen extends StatefulWidget {
  const FavoriteCharacterListScreen({super.key});

  @override
  State<FavoriteCharacterListScreen> createState() => _FavoriteCharacterListScreenState();
}

class _FavoriteCharacterListScreenState extends State<FavoriteCharacterListScreen> {
  List _favoriteCharacters = [];

  initialize() async {
    _favoriteCharacters = await CharacterDao().fetchAll();
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