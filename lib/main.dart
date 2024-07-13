import 'package:flutter/material.dart';
import 'package:gojek/UTS/components/detailriwayat.dart';
import 'package:gojek/UTS/components/gofood.dart';
import 'package:gojek/UTS/components/login.dart';
import 'package:gojek/UTS/components/riwayat.dart';
import 'package:gojek/UTS/components/signup.dart';
import 'package:gojek/UTS/components/welcome.dart';
import 'package:gojek/UTS/pages/home_page.dart';
import 'package:gojek/UTS/components/terdekat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const Welcome(),
        '/signup': (context) => const Signup(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        '/riwayat': (context) => riwayat(),
        '/detailriwayat': (context) => detailriwayat(),
        '/gofood': (context) => Gofood(),
        '/terdekat': (context) => Terdekat(),
      },
      title: 'Gojek',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
