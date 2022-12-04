import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';

// ignore: non_constant_identifier_names
Future ajouterUtilisateur(Utilisateur utilisateur) async {
  final docUtilisateur =
      FirebaseFirestore.instance.collection("Utilisateurs").doc();
  utilisateur.id = docUtilisateur.id;
// ignore: unused_local_variable

  print("--------------- ${utilisateur.toString()} -------------");
  await docUtilisateur.set(utilisateur.toJson());
}
