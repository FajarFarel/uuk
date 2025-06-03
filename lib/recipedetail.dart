import 'package:flutter/material.dart';
import 'recipe.dart';
import 'api.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resep Masakan')),
      body: FutureBuilder<List<Recipe>>(
        future: fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ExpansionTile(
                title: Text(recipe.name),
                children: [
                  ListTile(
                    title: const Text('Bahan-bahan:'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.ingredients.map((bahan) => Text('- $bahan')).toList(),
                    ),
                  ),
                  ListTile(
                    title: const Text('Cara Membuat:'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: recipe.instructions.map((langkah) => Text('• $langkah')).toList(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
