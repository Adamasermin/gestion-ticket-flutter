import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Couleur de fond douce
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.all(20.0), // Marges internes pour le conteneur
          margin: const EdgeInsets.symmetric(
              horizontal: 20.0), // Marges externes sur les côtés
          decoration: BoxDecoration(
            color: Colors.white, // Fond blanc pour le formulaire
            borderRadius: BorderRadius.circular(20.0), // Bordures arrondies
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Ombre douce
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 5), // Décalage de l'ombre vers le bas
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajuste la taille du conteneur pour le contenu
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Titre du formulaire
              const Text(
                'Connexion',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(
                  height: 20), // Espace entre le titre et le champ de texte

              // Champ d'entrée pour l'email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.blueAccent),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 20), // Espace entre les champs de texte

              // Champ d'entrée pour le mot de passe
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.blueAccent),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              const SizedBox(height: 30), // Espace avant le bouton

              // Bouton de connexion
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.login,
                    color: Colors.white), // Icône à côté du texte
                label: const Text('Connexion'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15), // Espacement interne
                  backgroundColor: Colors.blueAccent, // Couleur du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5, // Élévation pour l'ombre du bouton
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
