import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> supprimerFilm(String id) async {
  final document = FirebaseFirestore.instance.collection("Films").doc(id);
  await document.delete();
}
