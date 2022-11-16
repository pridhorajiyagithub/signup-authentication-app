import 'package:firebase_authentication_app/screens/home%20page.dart';
import 'package:firebase_authentication_app/screens/log%20in%20page.dart';
import 'package:firebase_authentication_app/screens/signup.dart';
import 'package:firebase_authentication_app/screens/splash%20screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LogInPage(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
      },
    ),
  );
}
