import 'package:flutter/material.dart';

class DetailsFilm extends StatelessWidget {
  String nom;
  String image;
  String annee;
  int like;
  // List<String> categories;
  DetailsFilm(
      {super.key,
      required this.nom,
      required this.image,
      required this.annee,
      required this.like});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details sur $nom "),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Année de Production:  $annee ",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Description sur le fim ainsi de suite ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
