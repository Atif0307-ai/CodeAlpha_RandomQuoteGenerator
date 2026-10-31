
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteApp());
}

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const QuoteHome(),
    );
  }
}

class QuoteHome extends StatefulWidget {
  const QuoteHome({super.key});

  @override
  State<QuoteHome> createState() => _QuoteHomeState();
}

class _QuoteHomeState extends State<QuoteHome> {
  final List<Map<String, String>> quotes = [
    {
      'quote': 'Every expert was once a beginner.',
      'author': 'Unknown',
    },
    {
      'quote': 'Small steps can lead to big changes.',
      'author': 'Unknown',
    },
    {
      'quote': 'Learning takes time and practice.',
      'author': 'Unknown',
    },
    {
      'quote': 'Keep moving forward, one step at a time.',
      'author': 'Unknown',
    },
    {
      'quote': 'Your effort today shapes your tomorrow.',
      'author': 'Unknown',
    },
  ];

  final Random random = Random();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = random.nextInt(quotes.length);
  }

  void newQuote() {
    int nextIndex;

    do {
      nextIndex = random.nextInt(quotes.length);
    } while (nextIndex == currentIndex);

    setState(() {
      currentIndex = nextIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = quotes[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.format_quote,
                size: 70,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 25),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        currentQuote['quote']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '- ${currentQuote['author']}',
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              FilledButton.icon(
                onPressed: newQuote,
                icon: const Icon(Icons.refresh),
                label: const Text('New Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
