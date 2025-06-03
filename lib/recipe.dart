class Recipe {
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final String? image;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final double rating;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final List<String> mealType;
 // Nilai default jika tidak ada

  Recipe({
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.image,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.rating,
    required this.cuisine,
    this.caloriesPerServing = 0, // Nilai default jika tidak ada
    this.tags = const [],
    this.mealType = const [],// Nilai default jika tidak ada
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      image: json['image'],
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      rating: (json['rating'] as num).toDouble(),
      cuisine: json['cuisine'], 
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      mealType: List<String>.from(json['mealType']),
 // Mengambil nilai mealType jika ada
    );
  }
}
