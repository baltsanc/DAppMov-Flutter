import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Básicos Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LDSW - 3.4. Utilización de widgets'), // Widget Text
      ),
      body: Container(
        // Widget Container principal que contiene todo
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red, width: 4),
          /* boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(200),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ], */
        ),
        child: Column(
          // Widget Column
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Widget Text
            const Text(
              'Column', // Widget Text
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            // Widget Row
            Row(
              // Widget Row
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'ROWs',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.red,
                  child: const Center(child: Text('R')), // Widget Text
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.green,
                  child: const Center(child: Text('o')), // Widget Text
                ),
                Container(
                  width: 60,
                  height: 60,
                  color: Colors.blue,
                  child: const Center(child: Text('w')), // Widget Text
                ),
              ],
            ),

            // Widget Stack
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                // Widget Stack
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text('Top')), // Widget Text
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.flutter_dash_sharp,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            'Centro', // Widget Text
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(child: Text('Bot')), // Widget Text
                    ),
                  ),
                ],
              ),
            ),

            Text(
              // Widget Text
              'CArgardo...',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
