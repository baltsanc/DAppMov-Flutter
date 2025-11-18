import 'package:db_flutter_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  TextEditingController newMovieController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agrega una Película',
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Roboto',
            color: Colors.white70,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: newMovieController,
              decoration: InputDecoration(
                hintText: 'Ingresa nombre de la película',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await addMovie(newMovieController.text).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
