import 'package:flutter/material.dart';

class TicketListPage extends StatefulWidget {
  const TicketListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TicketListPageState createState() => _TicketListPageState();
}

class _TicketListPageState extends State<TicketListPage> {
  // Track which toggle button is selected
  int _selectedIndex = 0;

  // Dummy ticket data
  final List<Map<String, String>> _tickets = [
    {"title": "Ticket 1", "status": "Attente", "date": "30/10/2019"},
    {"title": "Ticket 1", "status": "Attente", "date": "30/10/2019"},
    {"title": "Ticket 1", "status": "Traité", "date": "30/10/2019"},
    {"title": "Ticket 1", "status": "Traité", "date": "30/10/2019"},
  ];

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
          'Liste des tickets',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Toggle Buttons for Technique and Pédagogique
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Technique'),
                  selected: _selectedIndex == 0,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  selectedColor: Colors.grey[300],
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Pédagogique'),
                  selected: _selectedIndex == 1,
                  onSelected: (selected) {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  selectedColor: Colors.blue,
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // List of Tickets
            Expanded(
              child: ListView.builder(
                itemCount: _tickets.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(_tickets[index]["title"]!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Status: ${_tickets[index]["status"]!}",
                              style: TextStyle(
                                  color: _tickets[index]["status"] == "Attente"
                                      ? Colors.red
                                      : Colors.green)),
                          Text(_tickets[index]["date"]!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
