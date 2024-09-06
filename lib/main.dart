import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages/admin/formateur.dart';
import 'package:flutter_application_1/pages/admin/formulaire.apprenant.dart';
import 'package:flutter_application_1/pages/admin/formulaire.formateur.dart';
import 'package:flutter_application_1/pages/admin/homeDashboard.dart';
import 'package:flutter_application_1/pages/admin/settings.dart';
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
    return MaterialApp(

      routes: {
        '/': (context) =>  const HomeDash(),
        '/formateur': (context) => const Formateur(),
        '/settings': (context) =>   const Settings(),
        '/form-apprenant': (context) => const FormApprenant(),
        '/form-formateur': (context) => const FormFormateur()
      },
      debugShowCheckedModeBanner: false,

      // home: const HomeDash(),
    );
  }
}

