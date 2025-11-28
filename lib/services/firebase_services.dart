import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getMovie() async {
  List<Map<String, dynamic>> movies = [];
  CollectionReference collectionReferenceMovies = db.collection('movies');

  QuerySnapshot queryMovies = await collectionReferenceMovies.get();

  for (var doc in queryMovies.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    data['uid'] = doc.id;
    movies.add(data);
  }

  return movies;
}

Future<void> addMovie(String movie) async {
  await db.collection('movies').add({'movie': movie});
}

Future<void> addUser(String name, String email, String password) async {
  await db.collection('users').add({
    'name': name,
    'email': email,
    'password': password,
    'creation_date': FieldValue.serverTimestamp(),
  });
}

Future<void> addMovieFull(
  String movie,
  String date,
  String director,
  String genre,
  String image,
  String synopsis,
) async {
  await db.collection('movies').add({
    'movie': movie,
    'date': date,
    'director': director,
    'genre': genre,
    'image': image,
    'synopsis': synopsis,
    //'added_at': FieldValue.serverTimestamp(),
  });
}

Future<bool> loginUser(String email, String password) async {
  CollectionReference usersCollection = db.collection('users');
  Query query = usersCollection
      .where('email', isEqualTo: email)
      .where('password', isEqualTo: password)
      .limit(1);

  QuerySnapshot result = await query.get();
  return result.docs.isNotEmpty;
}

Future<void> deleteMovie(String uid) async {
  await db.collection('movies').doc(uid).delete();
}

Future<void> updateMovie(String uid, Map<String, dynamic> updatedData) async {
  await db.collection('movies').doc(uid).update(updatedData);
}
