import 'package:flutter/material.dart';
import 'package:flutter_firebase/crud/pages/afficher_utilisateurs.dart';
import 'package:flutter_firebase/crud/pages/ajouter_utilisateur.dart';
import 'package:flutter_firebase/main.dart';

class ControlePage extends StatelessWidget {
  const ControlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gestion des utilisateurs"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.supervised_user_circle_sharp,
                  size: 28,
                ),
                text: 'Ajouter',
              ),
              Tab(
                icon: Icon(
                  Icons.edit_attributes,
                  size: 28,
                ),
                text: 'Utilisateurs',
              ),
              Tab(
                icon: Icon(
                  Icons.movie,
                  size: 28,
                ),
                text: 'Films',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          AjouterUtilisateur(),
          AfficherUtilisateur(),
          MyHomePage(),
        ]),
      ),
    );
  }
}
