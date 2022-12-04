import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';

Future suprimerUtilisateur(String id) async {
  final doc =
      FirebaseFirestore.instance.collection("Utilisateurs").doc(id);
  await doc.delete();
}
