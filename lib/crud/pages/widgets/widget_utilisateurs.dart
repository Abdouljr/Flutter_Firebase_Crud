import 'package:flutter/material.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';

class UtilisateurWidget extends StatefulWidget {
  List<Utilisateur> utilisateurs;
  UtilisateurWidget({super.key, required this.utilisateurs});

  @override
  State<UtilisateurWidget> createState() => _UtilisateurWidgetState();
}

class _UtilisateurWidgetState extends State<UtilisateurWidget> {
  @override
  Widget build(BuildContext context) {
    final tous_utilisateus = widget.utilisateurs;
    return Container();
  }
}
