class Utilisateur {
  String id;
  String nom;
  String prenom;
  String email;
  int numero;

  Utilisateur(
      {this.id = "",
      required this.nom,
      required this.prenom,
      required this.email,
      required this.numero});

// ------------------------------------ comme firebase ne prend que du json ----------------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'numero': numero,
      'email': email,
      'prenom': prenom
    };
  }

// ------------------------------------ convertir le json en objet classique ---------------
  factory Utilisateur.fromJson(Map<String, dynamic> json) {
    return Utilisateur(
      id: json['id'],
      prenom: json['prenom'],
      nom: json['nom'],
      email: json['email'],
      numero: json['numero'],
    );
  }
}
