import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'profil.dart';
import 'recipedetail.dart';
import 'package:uuk/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Resep',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splashscreen(),
        '/': (context) => const LoginPage(),
        '/home': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return HomePage(
            userName: args['userName'],
            userImage: args['userImage'],
          );
        },
        '/profile': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ProfilPage(
            userName: args['userName'],
            userImage: args['userImage'],
          );
        },
        '/Logout': (context) => const LoginPage(),
        '/recipeDetail': (context) => const RecipesPage(),
      },
    );
  }
}

// ====================================================================
// WIDGET: CustomBottomNavigationBar
// ====================================================================


// ====================================================================
// SCREEN: LoginPage
// ====================================================================

// ====================================================================
// SCREEN: ProfilePage
// ====================================================================

// ====================================================================
// SCREEN: HomePage
// ====================================================================

// ====================================================================
// SCREEN: RecipeDetailPage
// ====================================================================
