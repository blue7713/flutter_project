import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class DataModel extends ChangeNotifier {
  int _data = 5;

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Provider Test',
          ),
        ),
        body: MultiProvider(
          providers: [
            FutureProvider<int>(
                create: (context) => Future.delayed(
                    Duration(seconds: 5), () => 5),
                initialData: 1,
            ),
          ],
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final seconds = Provider.of<int>(context);

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Seconds: $seconds',
          )
        ],
      ),
    );
  }
}
