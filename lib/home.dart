import 'package:flutter/material.dart';
import 'recipe.dart';
import 'api.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  final String userName;
  final File userImage;

  const HomePage({
    Key? key,
    required this.userName,
    required this.userImage,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _allRecipes = [];
  List<Recipe> _filteredRecipes = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  void _loadRecipes() async {
    final recipes = await fetchRecipes();
    setState(() {
      _allRecipes = recipes;
      _filteredRecipes = recipes;
    });
  }

  void _filterRecipes(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredRecipes = _allRecipes.where((recipe) {
        final nameMatch = recipe.name.toLowerCase().contains(_searchQuery);
        final tagsMatch =
            recipe.tags.any((tag) => tag.toLowerCase().contains(_searchQuery));
        return nameMatch || tagsMatch;
      }).toList();
    });
  }

  void _showRecipeDialog(BuildContext context, Recipe recipe, rating) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(recipe.name),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recipe.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(recipe.image!, height: 180),
                ),
              const SizedBox(height: 10),
              Text('⭐ Rating: ${recipe.rating}'),
              Text('🍽️ Porsi: ${recipe.servings}'),
              Text('⏱️ Persiapan: ${recipe.prepTimeMinutes} menit'),
              Text('🔥 Masak: ${recipe.cookTimeMinutes} menit'),
              Text('⚙️ Kesulitan: ${recipe.difficulty}'),
              Text('🔥 Kalori/serving: ${recipe.caloriesPerServing}'),
              Text('🏷️ Tags: ${recipe.tags.join(', ')}'),
              Text('🍱 Tipe Makan: ${recipe.mealType.join(', ')}'),
              const SizedBox(height: 10),
              const Text('🧂 Bahan-bahan:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ...recipe.ingredients.map((item) => Text('- $item')),
              const SizedBox(height: 10),
              const Text('👨‍🍳 Cara Membuat:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ...recipe.instructions.map((step) => Text('• $step')),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Tutup'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Cari resep berdasarkan nama atau tag...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterRecipes,
            ),
          ),
          Expanded(
            child: _filteredRecipes.isEmpty
                ? const Center(child: Text('Tidak ada resep ditemukan.'))
                : ListView.builder(
                    itemCount: _filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _filteredRecipes[index];
                      return ListTile(
                        leading: recipe.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(recipe.image!,
                                    width: 50, height: 50, fit: BoxFit.cover),
                              )
                            : const Icon(Icons.fastfood),
                        title: Text(recipe.name),
                        subtitle: Text(recipe.tags.join(', ')),
                        onTap: () => _showRecipeDialog(context, recipe, recipe.rating),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
