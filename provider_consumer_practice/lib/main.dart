import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class DataModel extends ChangeNotifier {
  int _data =5;

  int get data => _data;

  void increment() {
    _data++;
    notifyListeners();
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
          body: Center(
            child: MyWidget(),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('MyWidget');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer<DataModel>(
          builder: (context, dataModel, child) {
            print('Consumer builder in MyWidget');
            return ElevatedButton(
              onPressed: () {
                dataModel.increment();
              },
              child: Text(
                'MyWidget: ${dataModel.data}',
              ),
            );
          }
        ),
        AnotherWidget(),
      ],
    );
  }
}

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print('AnotherWidget');

    return Text(
      'AnotherWidget: I consume the model with value, but do nothing with it.'
    );
  }
}

