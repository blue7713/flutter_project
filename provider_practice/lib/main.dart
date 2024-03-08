import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Provider Test'
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Provider<int>(
                create: (context) {
                  int sum = 0;
                  for (int i = 0; i < 10; i++) {
                    sum += i;
                  }
                  return sum;
                },
                child: MyWidget1(),
            ),
            SizedBox(
              height: 10,
            ),
            MyWidget2(),
          ],
        ),
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<int>(context);

    print('MyWidget1');
    return Column(
      children: [
        Text('MyWidget1: $data'),
        MyWidget3(),
      ],
    );
  }
}

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyWidget2');
    return Center(
      child: Text(
        'MyWidget2'
      ),
    );
  }
}

class MyWidget3 extends StatelessWidget {
  const MyWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<int>(context);
    return Center(
      child: Text(
        'MyWidget3: $data'
      ),
    );
  }
}

