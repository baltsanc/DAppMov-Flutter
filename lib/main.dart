import 'package:db_flutter_app/pages/add_movie_page.dart';
import 'package:db_flutter_app/pages/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//Importaciones de Firestore
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Inicialización y conexión a Firebase (no a Firestore)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Después de contestar carga MyApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integración DB',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddMoviePage(),
      },
    );
  }
}
