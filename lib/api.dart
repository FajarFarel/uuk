import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe.dart'; // Sesuaikan nama file-nya

Future<List<Recipe>> fetchRecipes() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<dynamic> recipesJson = data['recipes'];
    return recipesJson.map((json) => Recipe.fromJson(json)).toList();
  } else {
    throw Exception('Gagal mengambil data resep');
  }
}
