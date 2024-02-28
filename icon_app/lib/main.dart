import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FunCoding'),
          actions: [
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
              splashColor: Colors.red,
              alignment: Alignment.topLeft,
              highlightColor: Colors.brown,
              hoverColor: Colors.amber,
            ),
            const IconButton(
              icon: Icon(Icons.place),
              tooltip: 'Comment Icon',
              onPressed: null,
              disabledColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

