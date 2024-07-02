import 'package:flutter/material.dart';
import 'package:cocktail/cocktail_screen/widgets/cocktail_details.dart';
import 'package:cocktail/dao/cocktail_dao.dart';
import 'package:cocktail/models/cocktail.dart';

class CocktailList extends StatefulWidget {
  final List<Cocktail> cocktails;

  const CocktailList({super.key, required this.cocktails});

  @override
  _CocktailListState createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  final Set<Cocktail> _favoriteCocktails = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.cocktails.length,
      itemBuilder: (context, index) {
        Cocktail cocktail = widget.cocktails[index];
        final bool isFavorite = _favoriteCocktails.contains(cocktail);
        
        return Card(
          child: ListTile(
            title: Text(cocktail.strDrink),
            subtitle: Text(cocktail.strCategory),
            leading: Image.network(cocktail.strDrinkThumb),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () async {
                setState(() {
                  if (isFavorite) {
                    _favoriteCocktails.remove(cocktail);
                    CocktailDao().delete(cocktail);
                  } else {
                    _favoriteCocktails.add(cocktail);
                    CocktailDao().insert(cocktail);
                  }
                });
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CocktailDetail(cocktail: cocktail),
                ),
              );
            },
          ),
        );
      },
    );
  }
}



/*class CocktailList extends StatelessWidget {
  const CocktailList({super.key, required this.cocktails});
  final List<Cocktail> cocktails;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          return CocktailCard(cocktail: cocktails[index]);
        });
  }
}*/

