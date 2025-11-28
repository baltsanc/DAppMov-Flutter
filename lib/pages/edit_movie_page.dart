import 'package:db_flutter_app/services/firebase_services.dart';
import 'package:flutter/material.dart';

class EditMoviePage extends StatefulWidget {
  final Map<String, dynamic> movieData;
  const EditMoviePage({super.key, required this.movieData});

  @override
  State<EditMoviePage> createState() => _EditMoviePageState();
}

class _EditMoviePageState extends State<EditMoviePage> {
  late TextEditingController titleController;
  late TextEditingController dateController;
  late TextEditingController directorController;
  late TextEditingController genreController;
  late TextEditingController imageController;
  late TextEditingController synopsisController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.movieData['movie'] ?? '',
    );
    dateController = TextEditingController(
      text: widget.movieData['date'] ?? '',
    );
    directorController = TextEditingController(
      text: widget.movieData['director'] ?? '',
    );
    genreController = TextEditingController(
      text: widget.movieData['genre'] ?? '',
    );
    imageController = TextEditingController(
      text: widget.movieData['image'] ?? '',
    );
    synopsisController = TextEditingController(
      text: widget.movieData['synopsis'] ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Película: ${widget.movieData['movie']}',
          style: const TextStyle(fontSize: 18.0, fontFamily: 'Roboto'),
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

              _buildTextField(
                imageController,
                'URL de la imagen (Poster)',
                'image',
              ),
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
                    Map<String, dynamic> updatedData = {
                      'movie': titleController.text,
                      'date': dateController.text,
                      'director': directorController.text,
                      'genre': genreController.text,
                      'image': imageController.text,
                      'synopsis': synopsisController.text,
                    };

                    await updateMovie(widget.movieData['uid'], updatedData)
                        .then((_) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Película actualizada con éxito.',
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        })
                        .catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error al actualizar: $error'),
                            ),
                          );
                        });
                  }
                },
                icon: const Icon(Icons.update),
                label: const Text(
                  'Actualizar Película',
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

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    directorController.dispose();
    genreController.dispose();
    imageController.dispose();
    synopsisController.dispose();
    super.dispose();
  }
}
