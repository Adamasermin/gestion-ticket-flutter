import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/ProfilPage.dart';
// import 'package:flutter_application_1/pages/TicketListPage.dart';
// import 'package:flutter_application_1/pages/TicketPage.dart';
import 'package:flutter_application_1/pages/connexion.dart';
// import 'package:flutter_application_1/pages/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      // routes: {
      //   '/': (context) => const HomePage(),
      //   '/profil': (context) => UserProfilePage(),
      //   '/Liste': (context) =>  const TicketListPage(),
      //   '/ticket': (context) =>  TicketFormPage(),

      // },
      debugShowCheckedModeBanner: false,

      home: Connexion(),
    );
  }
}

