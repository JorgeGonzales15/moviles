class Cocktail {
  final String idDrink;
  final String strDrink;
  final String strCategory;
  final String strInstructions;
  final String strDrinkThumb;

  const Cocktail({
    required this.idDrink,
    required this.strDrink,
    required this.strCategory,
    required this.strInstructions,
    required this.strDrinkThumb,
  });

  Cocktail.fromJson(Map<String, dynamic> map)
      : idDrink = map["idDrink"],
        strDrink = map["strDrink"],
        strCategory = map["strCategory"],
        strInstructions = map["strInstructions"],
        strDrinkThumb = map["strDrinkThumb"];

  Map<String, dynamic> toMap() {
    return {
      'id': idDrink,
      'name': strDrink,
      
    };
  }
}

class FavoriteCocktail {
  final String id;
  final String name;


  const FavoriteCocktail({
    required this.id,
    required this.name,
  });

  FavoriteCocktail.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"];



}