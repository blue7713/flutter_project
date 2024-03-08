import 'package:flutter/material.dart';
// import 'new_page.dart';
import 'new_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      /* routes: {
        '/newPage': (context) => NewPage(),
      },*/
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(
            'Go to new page',
          ),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NewPage(message: "Hello from the home",),
              ),
            );
            print(result);
          },
        ),
      ),
    );
  }
}
