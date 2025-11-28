import 'package:db_flutter_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddMoviePage extends StatefulWidget {
  const AddMoviePage({super.key});

  @override
  State<AddMoviePage> createState() => _AddMoviePageState();
}

class _AddMoviePageState extends State<AddMoviePage> {
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController dateController = TextEditingController(text: '');
  TextEditingController directorController = TextEditingController(text: '');
  TextEditingController genreController = TextEditingController(text: '');
  TextEditingController imageController = TextEditingController(text: '');
  TextEditingController synopsisController = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar Película',
          style: TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                titleController,
                'Título de la película',
                'movie',
              ),
              const SizedBox(height: 15),

              _buildTextField(
                directorController,
                'Nombre del Director',
                'director',
              ),
              const SizedBox(height: 15),

              _buildTextField(
                genreController,
                'Género (Ej: Ciencia Ficción)',
                'genre',
              ),
              const SizedBox(height: 15),

              _buildTextField(
                dateController,
                'Año de lanzamiento (YYYY)',
                'date',
              ),
              const SizedBox(height: 15),

              _buildTextField(imageController, 'URL de la imagen', 'image'),
              const SizedBox(height: 15),

              _buildTextField(
                synopsisController,
                'Sinopsis',
                'synopsis',
                maxLines: 5,
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await addMovieFull(
                          titleController.text,
                          dateController.text,
                          directorController.text,
                          genreController.text,
                          imageController.text,
                          synopsisController.text,
                        )
                        .then((_) {
                          if (context.mounted) Navigator.pop(context);
                        })
                        .catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error al guardar: $error')),
                          );
                        });
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text(
                  'Guardar Película',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String key, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        hintText: 'Ingresa el $label',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa el $label';
        }
        return null;
      },
    );
  }
}
