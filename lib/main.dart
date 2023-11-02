import 'dart:async';
import 'package:flutter_application_1/calc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: SplashScreen()
    )
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState() {
      super.initState();
      Timer(const Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyApp())));
      }
@override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center, 
              children: [
                Image.asset("assets/image/house.png"),
                const SizedBox(height: 10),
                const Text(
                  style: TextStyle(fontSize: 32),
                  "Load Calculator")
                ]
            )
          )
        )
    );
  }
}