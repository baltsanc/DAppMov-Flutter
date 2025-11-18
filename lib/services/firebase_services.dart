import 'package:cloud_firestore/cloud_firestore.dart';

/* 
Future<List> getMovie() async {
  List movies = [];

  try {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference collectionReferenceMovies = db.collection('movies');

    QuerySnapshot queryMovies = await collectionReferenceMovies.get();

    for (var peli in queryMovies.docs) {
      movies.add(peli.data());
    }
  } on FirebaseException catch (e) {
    print('Firebase Error: ${e.code}. Firestore no está en esta plataforma');
    return [];
  } catch (e) {
    print('Error general al obtener películas: $e');
    return [];
  }

  await Future.delayed(const Duration(seconds: 1));

  return movies;
}
 */

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getMovie() async {
  List movies = [];
  CollectionReference collectionReferenceMovies = db.collection('movies');

  QuerySnapshot queryMovies = await collectionReferenceMovies.get();

  queryMovies.docs.forEach((peli) {
    movies.add(peli.data());
  });

  return movies;
}

Future<void> addMovie(String movie) async {
  await db.collection('movies').add({'movie': movie});
}
