import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class DataModel extends ChangeNotifier {
  int _data = 0;
  int get data => _data;

  void increment() {
    _data++;
    notifyListeners(); // 값이 바뀌었음을 위젯들에게 알려줌
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Provider Test',
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyWidget1(),
              MyWidget2(),
              MyWidget3(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget1 extends StatelessWidget {
  const MyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<DataModel>(context);

    print('MyWidget1');
    return Center(
      child: Column(
        children: [
          Text(
            'MyWidget1: ${dataModel.data}',
          ),
          ElevatedButton(
              onPressed: () {
                dataModel.increment();
              },
              child: Text(
                'Increment',
              ),
          ),
        ],
      ),
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
    final dataModel = Provider.of<DataModel>(context);

    print('MyWidget3');
    return Center(
      child: Column(
        children: [
          Text(
            'MyWidget3: ${dataModel.data}',
          ),
          ElevatedButton(
              onPressed:() {
                dataModel.increment();
              },
              child: Text(
                'Increment',
              ))
        ],
      ),
    );
  }
}
