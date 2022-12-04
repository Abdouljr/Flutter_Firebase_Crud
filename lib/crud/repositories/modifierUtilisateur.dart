import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';

Future modifierUtilisateur(Utilisateur utilisateur) async {
  final docUtilisateur =
      FirebaseFirestore.instance.collection("Utilisateurs").doc(utilisateur.id);
  await docUtilisateur.update(utilisateur.toJson());
}
