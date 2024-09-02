import 'package:flutter/material.dart';


class TicketFormPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  TicketFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Implement back navigation if necessary
          },
        ),
        title: const Text(
          'Tickets',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Titre Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Titre',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Categorie Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Catégorie',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Priorité Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Priorité',
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Description Input
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  // Submit Button
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Implement form submission
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: const Text(
                      'Soumettre',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
