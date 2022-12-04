import 'package:flutter/material.dart';
import 'package:flutter_firebase/main.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  bool secret = true;
  bool mdp_nombre_caractere = false;
  bool mdp_contient_nombre = false;

  changementMdp(String mdp) {
    final nombreRegexp = RegExp(r'[0-9]');

    setState(() {
      mdp_nombre_caractere = false;
      if (mdp.length >= 8) mdp_nombre_caractere = true;

      mdp_contient_nombre = false;
      if (nombreRegexp.hasMatch(mdp)) mdp_contient_nombre = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Connexion",
      //   ),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: [
          Center(
              child: Container(
            height: size.height,
            width: size.width,
            padding: const EdgeInsets.fromLTRB(20, 200, 20, 80),
            child: Column(
              children: [
                const Text(
                  "Connexion",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "example@gg.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  onChanged: (mdp) => changementMdp(mdp),
                  obscureText: secret,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            secret = !secret;
                          });
                        },
                        icon: Icon(
                            !secret ? Icons.visibility_off : Icons.visibility)),
                    hintText: "M5dd3#!",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: mdp_nombre_caractere
                              ? Colors.green
                              : Colors.transparent,
                          border: mdp_nombre_caractere
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contient au moins 8 caractères")
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(microseconds: 500),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: mdp_contient_nombre
                              ? Colors.green
                              : Colors.transparent,
                          border: mdp_contient_nombre
                              ? Border.all(color: Colors.transparent)
                              : Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Contient au moins 1 nombre")
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 45,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const MyHomePage()));
                      },
                      child: const Text(
                        "Connecter",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
