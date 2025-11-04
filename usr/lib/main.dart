import 'package:flutter/material.dart';

void main() {
  runApp(const DAMRASystemApp());
}

class DAMRASystemApp extends StatelessWidget {
  const DAMRASystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DAMRA SYSTEM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const DAMRAHomePage(),
    );
  }
}

class DAMRAHomePage extends StatefulWidget {
  const DAMRAHomePage({super.key});

  @override
  State<DAMRAHomePage> createState() => _DAMRAHomePageState();
}

class _DAMRAHomePageState extends State<DAMRAHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAMRA SYSTEM'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to DAMRA SYSTEM',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This is the main screen of the DAMRA SYSTEM application.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}