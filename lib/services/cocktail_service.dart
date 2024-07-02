import 'dart:convert';
import 'dart:io';

import 'package:cocktail/models/cocktail.dart';
import 'package:http/http.dart' as http;


/*class CocktailService {
  final String baseUrl =
      "https://www.thecocktaildb.com/api/json/v1/1/search.php";

  Future<List<Cocktail>> filterByName(String name) async {
     http.Response response = await http.get(Uri.parse("$baseUrl?s=$name"));
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseMap = json.decode(response.body);
      List<dynamic> results = responseMap["results"];
      return results.map((map) => Cocktail.fromJson(map)).toList();
    } else {
      print("Error: ${response.statusCode}");
    }
    return [];
  }
}*/

class CocktailService {
  final String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php";

  Future<List<Cocktail>> filterByName(String name) async {
    http.Response response = await http.get(Uri.parse("$baseUrl?s=$name"));
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseMap = json.decode(response.body);
      if (responseMap["drinks"] != null) {
        List<dynamic> results = responseMap["drinks"];
        return results.map((map) => Cocktail.fromJson(map)).toList();
      } else {
        print("No cocktails found.");
        return [];
      }
    } else {
      print("Error: ${response.statusCode}");
      return [];
    }
  }
}