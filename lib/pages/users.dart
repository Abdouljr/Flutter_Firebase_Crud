import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List utilisateurs = [
    {
      "nom": "Abdoulaziz Maïga",
      "pseudo": "@Fall",
      "profil":
          "https://cdn.smehost.net/sonymusicfr-frprod/wp-content/uploads/2022/02/272989362_7025579037483200_1865016672451966015_n.jpg",
      "follow": false,
    },
    {
      "nom": "Tiékoura Diarra",
      "pseudo": "@benab",
      "follow": false,
      "profil":
          "https://static.wikia.nocookie.net/spidermanps4/images/d/d4/Marvel%27s_Spider-Man_front_cover_%28US%29.png/revision/latest?cb=20201003182432",
    },
    {
      "nom": "Fatoumata Coulibaly",
      "pseudo": "@maes!",
      "profil": "https://cdn.mos.cms.futurecdn.net/P6RbzmckgPtdvDqLxo3FYU.jpg",
      "follow": false,
    },
    {
      "nom": "Fatoumata Coulibaly",
      "pseudo": "@maes!",
      "profil": "https://cdn.mos.cms.futurecdn.net/P6RbzmckgPtdvDqLxo3FYU.jpg",
      "follow": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Utilisateurs que vous pouvez suivre",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: utilisateurs.map((utilisateur) {
            return Container(
              margin: const EdgeInsets.only(top: 10),
              // width: double.infinity,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(190),
                          child: Image.network(
                            utilisateur['profil'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            utilisateur['nom'],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            utilisateur['pseudo'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border.all(
                          color: const Color.fromARGB(15, 0, 0, 0),
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      //Pour que si on clique sur le boutton ça devient rond un peu
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 0,
                      color: utilisateur['follow']
                          ? const Color(0xFFeeeeee)
                          : const Color(0xFFffffff),
                      onPressed: () {
                        setState(() {
                          utilisateur['follow'] = !utilisateur['follow'];
                        });
                      },
                      child: Text(
                        !utilisateur['follow'] ? "Follow" : "Unfollow",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList()),
        ),
      ),
    );
  }
}

// body: Center(
//   child: Container(
//     // color: Colors.white,
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(190),
//       child: Image.network('https://picsum.photos/250?image=1'),
//     ),
//   ),
// )
