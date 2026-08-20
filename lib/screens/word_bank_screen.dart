import 'package:flutter/material.dart';
import '../services/database_helper.dart';

class WordBankScreen extends StatefulWidget {
  const WordBankScreen({super.key});

  @override
  State<WordBankScreen> createState() => _WordBankScreenState();
}

class _WordBankScreenState extends State<WordBankScreen> {

  final englishController = TextEditingController();
  final persianController = TextEditingController();

  List<Map<String, dynamic>> words = [];

  @override
  void initState() {
    super.initState();
    loadWords();
  }


  Future<void> loadWords() async {
    final data = await DatabaseHelper.getWords();

    setState(() {
      words = data;
    });
  }


  Future<void> addWord() async {

    if (englishController.text.isNotEmpty &&
        persianController.text.isNotEmpty) {

      await DatabaseHelper.insertWord(
        englishController.text,
        persianController.text,
      );

      englishController.clear();
      persianController.clear();

      loadWords();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Bank'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: englishController,
              decoration: const InputDecoration(
                labelText: 'English Word',
              ),
            ),

            TextField(
              controller: persianController,
              decoration: const InputDecoration(
                labelText: 'Persian Meaning',
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: addWord,
              child: const Text('Add Word'),
            ),


            Expanded(
              child: ListView.builder(
                itemCount: words.length,

                itemBuilder: (context,index){

                  return ListTile(
                    title: Text(
                      words[index]['english'],
                    ),

                    subtitle: Text(
                      words[index]['persian'],
                    ),
                  );

                },
              ),
            )

          ],
        ),
      ),
    );
  }
}