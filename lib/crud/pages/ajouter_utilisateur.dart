import 'package:flutter/material.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';
import 'package:flutter_firebase/crud/repositories/ajouterUtilisateur.dart';

class AjouterUtilisateur extends StatelessWidget {
  const AjouterUtilisateur({super.key});

  @override
  Widget build(BuildContext context) {
    final cnom = TextEditingController();
    final cprenom = TextEditingController();
    final cemail = TextEditingController();
    final cnumero = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: cnom,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    labelText: "Nom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (valeur) =>
                      valeur!.isEmpty ? "Veillez remplir ce champ" : null,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: cprenom,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    labelText: "Prénom",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (valeur) =>
                      valeur!.isEmpty ? "Veillez remplir ce champ" : null,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: cemail,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (valeur) =>
                      valeur!.isEmpty ? "Veillez remplir ce champ" : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: cnumero,
                    style: const TextStyle(fontSize: 22),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                      labelText: "Numéro",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    validator: (valeur) {
                      if (valeur!.isEmpty) {
                        return "Veillez remplir ce champ";
                      }
                      if (valeur.length < 8 || valeur.length > 25) {
                        return "Verifier le nombre de caractère";
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
// ----------------------------------- BOUTTON DE VALIDATION ---------------------------
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.greenAccent)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final utilisateur = Utilisateur(
                          nom: cnom.text,
                          prenom: cprenom.text,
                          email: cemail.text,
                          numero: int.parse(cnumero.text));

                      ajouterUtilisateur(utilisateur);
                      cnom.text = '';
                      cprenom.text = '';
                      cnumero.text = '';
                      cemail.text = '';
                    }
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Icon(
                      Icons.add,
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
