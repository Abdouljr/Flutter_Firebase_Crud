import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/crud/modeles/utilisateur.dart';
import 'package:flutter_firebase/crud/repositories/modifierUtilisateur.dart';
import 'package:flutter_firebase/crud/repositories/supprimerUtilisateur.dart';

class AfficherUtilisateur extends StatefulWidget {
  const AfficherUtilisateur({super.key});

  @override
  State<AfficherUtilisateur> createState() => _AfficherUtilisateurState();
}

class _AfficherUtilisateurState extends State<AfficherUtilisateur> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> utilisateurs = FirebaseFirestore.instance
        .collection("Utilisateurs")
        .orderBy("nom")
        .snapshots();

    final controllerNom = TextEditingController();
    final controllerPrenom = TextEditingController();
    final controllerEmail = TextEditingController();
    final controllerNumero = TextEditingController();

    final formKey = GlobalKey<FormState>();
// ----------------------------- le stream builder prend deux paramettres stream et builder -------
    // on peut utiliser FutureBuilder avec future et .get() mais ça ne sera pas synchroniser
    return StreamBuilder<QuerySnapshot>(
      stream: utilisateurs,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Erreur',
            style: TextStyle(color: Colors.red),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: snapshot.data!.docs.map((document) {
                Map<String, dynamic> utilisateur =
                    document.data() as Map<String, dynamic>;
                return Card(
                  color: Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
// -------------------------------------  AVATAR  --------------------------------------------------
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text(
                            utilisateur['nom'][0].toUpperCase(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
// ------------------------------------ NOM OU PRENOM ----------------------------------
                        SizedBox(
                          child: Text(
                            utilisateur['nom'],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
// ------------------------------------ NUMERO DE TELEPHONE  --------------------------------
                        SizedBox(
                          child: Text(
                            utilisateur['numero'].toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
// ------------------------------ BOUTTON MODIFIER ------------------------------------------
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Center(
                                              child: Text(
                                                  "Modifier:  ${utilisateur['nom']}"),
                                            ),
                                            content: SingleChildScrollView(
                                              child: SizedBox(
                                                  child: Form(
                                                key: formKey,
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      style: const TextStyle(
                                                          fontSize: 22),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        18),
                                                        labelText: "Nom",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                      ),
                                                      controller: controllerNom,
                                                      validator: (valeur) =>
                                                          valeur!.isEmpty
                                                              ? "Veillez remplir ce champ"
                                                              : null,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    TextFormField(
                                                      style: const TextStyle(
                                                          fontSize: 22),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        18),
                                                        labelText: "Prénom",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                      ),
                                                      controller:
                                                          controllerPrenom,
                                                      validator: (valeur) =>
                                                          valeur!.isEmpty
                                                              ? "Veillez remplir ce champ"
                                                              : null,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    TextFormField(
                                                      style: const TextStyle(
                                                          fontSize: 22),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        18),
                                                        labelText: "Email",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                      ),
                                                      controller:
                                                          controllerEmail,
                                                      validator: (valeur) =>
                                                          valeur!.isEmpty
                                                              ? "Veillez remplir ce champ"
                                                              : null,
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      style: const TextStyle(
                                                          fontSize: 22),
                                                      decoration:
                                                          const InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        18),
                                                        labelText: "Numéro",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          12)),
                                                        ),
                                                      ),
                                                      controller:
                                                          controllerNumero,
                                                      validator: (valeur) {
                                                        if (valeur!.isEmpty) {
                                                          return "Veillez remplir ce champ";
                                                        }
                                                        if (valeur.length < 8 ||
                                                            valeur.length >=
                                                                12) {
                                                          return "Verifier le nombre de caractère";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          if (formKey
                                                              .currentState!
                                                              .validate()) {
                                                            Utilisateur util = Utilisateur(
                                                                id: utilisateur[
                                                                    'id'],
                                                                nom:
                                                                    controllerNom
                                                                        .text,
                                                                prenom:
                                                                    controllerPrenom
                                                                        .text,
                                                                email:
                                                                    controllerEmail
                                                                        .text,
                                                                numero: int.parse(
                                                                    controllerNumero
                                                                        .text));
                                                            modifierUtilisateur(
                                                                util);
                                                          }
                                                        },
                                                        child: const SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: Center(
                                                              child: Text(
                                                                  "Modifier")),
                                                        ))
                                                  ],
                                                ),
                                              )),
                                            ),
                                            // ------- BOUTTON ANNULER  ---------------------
                                            actions: [
                                              ElevatedButton(
                                                  style: const ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.red)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text("Annuler"))
                                            ],
                                          ));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Center(
                                              child: Text(
                                                "Voulez-vous supprimer  ${utilisateur['nom']} ?",
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors.red)),
                                                    onPressed: () {
                                                      suprimerUtilisateur(
                                                          utilisateur['id']);
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Oui")),
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStatePropertyAll(
                                                                Colors
                                                                    .greenAccent)),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text("Non")),
                                              ],
                                            ),
                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }).toList()),
        );
      },
    );
  }
}
