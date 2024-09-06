import 'package:flutter/material.dart';

class Formateur extends StatelessWidget {
  const Formateur({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> donnee = [
      {'id': '1', 'name': 'Jean Dupont', 'email': 'jean.dupont@example.com'},
      {'id': '2', 'name': 'Marie Dubois', 'email': 'marie.dubois@example.com'},
      {
        'id': '3',
        'name': 'Pierre Martin',
        'email': 'pierre.martin@example.com'
      },
      // Ajoutez plus d'éléments ici
    ];
    
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Ouvre le drawer
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: const Text('Formateurs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/formateur');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Formateurs",
                    style: TextStyle(color: Colors.black87, fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF8BA3CB),
                        ),
                        hintText: "Recherche",
                        hintStyle: TextStyle(
                          color: Color(0xFF8BA3CB),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              // width: 100,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(5),
              width: double.infinity * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: <Widget>[
                  Text(
                    "Nombre de formateurs",
                    style: TextStyle(color: Color(0xFF718EBF), fontSize: 10),
                  ),
                  Text(
                    "50",
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),

              alignment: Alignment.topLeft,
              child: const Text(
                "Liste des formateurs",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF333B69), fontSize: 10),
              ),
            ),
             Align(
                
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, '/form-formateur');
                  },
                  child: const Text(
                    'Ajouter un nouveau',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 4, 89, 158)),
                  ),
                )),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final bool isSmallScreen = constraints.maxWidth < 400;
                  return ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DataTable(
                          columnSpacing: isSmallScreen ? 5.0 : 10.0,
                          headingRowHeight: 30.0,
                          // ignore: deprecated_member_use
                          dataRowHeight: 40.0,
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Id',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Nom',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Email',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Action',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                          rows: donnee.map((item) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(FittedBox(child: Text(item['id']!))),
                                DataCell(FittedBox(child: Text(item['name']!))),
                                DataCell(
                                    FittedBox(child: Text(item['email']!))),
                                DataCell(Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit,
                                          color: Colors.blue,
                                          size: isSmallScreen ? 18 : 24),
                                      onPressed: () {
                                        // Action de modification
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete,
                                          color: Colors.red,
                                          size: isSmallScreen ? 18 : 24),
                                      onPressed: () {
                                        // Action de suppression
                                      },
                                    ),
                                  ],
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
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
