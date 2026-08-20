import 'package:flutter/material.dart';
import 'word_bank_screen.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VOCAB1'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              child: const Text('Word Bank'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WordBankScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Start Game'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Statistics'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Statistics - Coming Soon'),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              child: const Text('Exit'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Exit button'),
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