import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/ajouter.dart';
import 'package:flutter_firebase/crud/pages/controle_page.dart';
import 'package:flutter_firebase/crud/repositories/supprimerFilm.dart';
import 'package:flutter_firebase/pages/details_film.dart';

Future<void> main() async {
  // Pour initialiser le projet firebase dans flutter
  WidgetsFlutterBinding
      .ensureInitialized(); // widget pour faire comprendre à flutter qu'on fait du badding
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ControlePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: const Text("Flutter Firebase"),
      // leading: IconButton(
      //   icon: const Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (BuildContext context) {
      //           return const AjouterWidget();
      //         },
      //         fullscreenDialog: true,
      //       ),
      //     );
      //   },
      // ),
      // centerTitle: true,
      // ),
      body: const FilmsWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AjouterWidget(),
                fullscreenDialog: true,
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FilmsWidget extends StatefulWidget {
  const FilmsWidget({super.key});

  @override
  State<FilmsWidget> createState() => _FilmsWidgetState();
}

class _FilmsWidgetState extends State<FilmsWidget> {
  final Stream<QuerySnapshot> filmsStream =
      FirebaseFirestore.instance.collection("Films").snapshots();

  // final List<String> nouvelle = FirebaseFirestore.instance
  //     .collection("Films")
  //     .snapshots() as List<String>;
// une méthode permettant de changer le nombre de like dans l'interface et dans bd
  void aimer(String id, int like) {
    int nblike = like + 1;
    try {
      FirebaseFirestore.instance.collection("Films").doc(id).update({
        "likes": nblike,
        // ignore: avoid_print
      }).then((value) => print("Donnée mis à jour"));
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  // CREATION D'UNE INSTANCE DE LA TRANSION DU TYPE FADETHROUG
  ContainerTransitionType trasition = ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: filmsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> film =
                document.data()! as Map<String, dynamic>;
            return OpenContainer(
                closedColor: Colors.black12,
                transitionType: trasition,
                transitionDuration: const Duration(seconds: 1),
                closedBuilder: ((context, action) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  film["image"],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  film["nom"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Année de Production",
                                ),
                                Text(
                                  film["annee"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    for (var categorie in film["categories"])
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Chip(
                                            backgroundColor: Colors.lightBlue,
                                            label: Text(categorie)),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        aimer(document.id, film["likes"]);
                                      },
                                      icon: const Icon(Icons.favorite),
                                    ),
                                    Text(
                                      film["likes"].toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Center(
                                              child: Wrap(children: [
                                                const Center(
                                                  child: Text(
                                                      "Voulez-vous supprimer ? "),
                                                ),
                                                Center(child: Text(film['nom']))
                                              ]),
                                            ),
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.red),
                                                    onPressed: () {
                                                      supprimerFilm(
                                                          document.id);
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
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
                openBuilder: ((context, action) {
                  return DetailsFilm(
                      nom: film['nom'],
                      image: film['image'],
                      annee: film['annee'],
                      like: film['likes']);
                }));
          }).toList(),
        );
      },
    );
  }
}
