import 'package:apptestfy/views/pages/details_page.dart';
import 'package:apptestfy/views/pages/home_page.dart';
import 'package:apptestfy/views/pages/login_page.dart';
import 'package:apptestfy/views/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}
