import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge #1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlphabetScreen(),
    );
  }
}

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  AlphabetScreenState createState() => AlphabetScreenState();
}

class AlphabetScreenState extends State<AlphabetScreen> {
  final List<String> alphabet = List.generate(
      26, (index) => String.fromCharCode('A'.codeUnitAt(0) + index));
  int currentIndex = 0;

  void goToPreviousLetter() {
    setState(() {
      currentIndex = (currentIndex - 1) % alphabet.length;
      if (currentIndex < 0) {
        currentIndex = alphabet.length - 1;
      }
    });
  }

  void goToNextLetter() {
    setState(() {
      currentIndex = (currentIndex + 1) % alphabet.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegador alfabeto'),
      ),
      body: Center(
        child: Text(
          alphabet[currentIndex],
          style: const TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: goToPreviousLetter,
            child: const Icon(Icons.navigate_before),
          ),
          FloatingActionButton(
            onPressed: goToNextLetter,
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
