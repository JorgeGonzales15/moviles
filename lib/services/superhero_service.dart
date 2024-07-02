import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:supercomicsapp/models/superhero.dart';

class SuperHeroService {
  final String baseUrl =
      "https://www.superheroapi.com/api.php/10157703717092094/search/";

  Future<List> searchHeros(String name) async {
    http.Response response = await http.get(Uri.parse("$baseUrl$name"));
    if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> responseMap = json.decode(response.body);
      List<dynamic> results = responseMap["results"];
      return results.map((map) => Superhero.fromJson(map)).toList();
    } else {
      print("Error: ${response.statusCode}");
    }
    return [];
  }
}
