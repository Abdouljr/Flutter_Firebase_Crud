import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/crud/modeles/film.dart';
import 'package:multiselect/multiselect.dart';

class AjouterWidget extends StatefulWidget {
  const AjouterWidget({super.key});

  @override
  State<AjouterWidget> createState() => _AjouterWidgetState();
}

class _AjouterWidgetState extends State<AjouterWidget> {
  final nomController = TextEditingController();
  final anneeController = TextEditingController();
  final imageController = TextEditingController();

  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.white30, width: 1.5)),
              title: Row(
                children: [
                  const Text("Nom:"),
                  Expanded(
                    child: TextField(
                      controller: nomController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.white30, width: 1.5)),
              title: Row(
                children: [
                  const Text("Année:"),
                  Expanded(
                    child: TextField(
                      controller: anneeController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(color: Colors.white30, width: 1.5)),
              title: Row(
                children: [
                  const Text("Image:"),
                  Expanded(
                    child: TextField(
                      controller: imageController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropDownMultiSelect(
              onChanged: (List<String> x) {
                setState(() {
                  categories = x;
                });
              },
              options: const [
                'Action',
                'Science-fition',
                'Aventure',
                'Comédie'
              ],
              selectedValues: categories,
              whenEmpty: 'Catégorie',
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.greenAccent),
              onPressed: () {
                // FirebaseFirestore.instance.collection("Films").add({
                //   "nom": nomController.value.text,
                //   "annee": anneeController.value.text,
                //   "image": imageController.value.text,
                //   "categories": categories,
                //   "likes": 0,
                // });
                final film = Film(
                    nom: nomController.value.text,
                    image: imageController.value.text,
                    like: 0,
                    annee: anneeController.value.text);
                FirebaseFirestore.instance
                    .collection("Films")
                    .add(film.toJson());
                Navigator.pop(context);
              },
              child: const Text("Ajouter"),
            )
          ],
        ),
      ),
    );
  }
}
