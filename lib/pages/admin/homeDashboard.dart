import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Importez fl_chart

class HomeDash extends StatelessWidget {
  const HomeDash({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de liste de données
    final List<Map<String, String>> data = [
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
      body: SingleChildScrollView(
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
                    "Accueil",
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

            // Ticket Summary Section
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: <Widget>[
                  Text(
                    "Nombre de tickets soumis",
                    style: TextStyle(color: Color(0xFF718EBF), fontSize: 10),
                  ),
                  Text(
                    "1250",
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                ],
              ),
            ),

            // Total Tickets Section
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Total tickets soumis par mois",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF333B69), fontSize: 20),
              ),
            ),

            // Graphique linéaire
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(8),
              height: 200, // Définissez la hauteur du graphique
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Color(0xFF8BA3CB),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Jan', style: style);
                            case 1:
                              return const Text('Feb', style: style);
                            case 2:
                              return const Text('Mar', style: style);
                            case 3:
                              return const Text('Apr', style: style);
                            case 4:
                              return const Text('May', style: style);
                            case 5:
                              return const Text('Jun', style: style);
                            case 6:
                              return const Text('Jul', style: style);
                            case 7:
                              return const Text('Aug', style: style);
                            case 8:
                              return const Text('Sep', style: style);
                            case 9:
                              return const Text('Oct', style: style);
                            case 10:
                              return const Text('Nov', style: style);
                            case 11:
                              return const Text('Dec', style: style);
                            default:
                              return const Text('', style: style);
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            color: Color(0xFF8BA3CB),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          );
                          return Text(value.toInt().toString(), style: style);
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xFF8BA3CB),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 3),
                        const FlSpot(1, 2),
                        const FlSpot(2, 5),
                        const FlSpot(3, 3.1),
                        const FlSpot(4, 4),
                        const FlSpot(5, 3),
                        const FlSpot(6, 4),
                        const FlSpot(7, 3.8),
                        const FlSpot(8, 5),
                        const FlSpot(9, 3.3),
                        const FlSpot(10, 4),
                        const FlSpot(11, 4.5),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),

            // Learner Section
            Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
              child: const Text(
                "Section apprenants",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF333B69), fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/form-apprenant');
                },
                child: const Text(
                  'Ajouter un nouveau',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 4, 89, 158)),
                ),
              ),
            ),

            // Data Table Section
            LayoutBuilder(
              builder: (context, constraints) {
                final bool isSmallScreen = constraints.maxWidth < 400;
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DataTable(
                    columnSpacing: isSmallScreen ? 5.0 : 10.0,
                    headingRowHeight: 30.0,
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
                    rows: data.map((item) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(FittedBox(child: Text(item['id']!))),
                          DataCell(FittedBox(child: Text(item['name']!))),
                          DataCell(FittedBox(child: Text(item['email']!))),
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
