import 'package:db_flutter_app/pages/add_movie_page.dart';
import 'package:db_flutter_app/pages/catalog_page.dart';
import 'package:db_flutter_app/pages/register_page.dart';
import 'package:db_flutter_app/pages/login_page.dart';
import 'package:db_flutter_app/pages/manage_movies_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData _buildDarkTheme() {
    const MaterialColor crimsonRed = MaterialColor(0xFFE50914, <int, Color>{
      50: Color(0xFFFEE0E1),
      100: Color(0xFFFBB3B6),
      200: Color(0xFFF78186),
      300: Color(0xFFF34E54),
      400: Color(0xFFEF2831),
      500: Color(0xFFE50914),
      600: Color(0xFFC70710),
      700: Color(0xFFA5050D),
      800: Color(0xFF83030A),
      900: Color(0xFF620207),
    });

    return ThemeData(
      colorScheme: ColorScheme.dark(
        primary: crimsonRed,
        secondary: Colors.amber,
        surface: const Color(0xFF1E1E1E),
      ),
      fontFamily: 'Roboto',

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF333333),
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: crimsonRed, width: 2.0),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: crimsonRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),

      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: crimsonRed,
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integración DB',
      theme: _buildDarkTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/catalog': (context) => const Catalog(),
        '/add': (context) => const AddMoviePage(),
        '/register': (context) => const RegisterPage(),
        '/manage': (context) => const ManageMoviesPage(),
      },
    );
  }
}
