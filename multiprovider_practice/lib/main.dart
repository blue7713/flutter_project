import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class PlusCounter with ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners();
  }
}

class MinusCounter with ChangeNotifier {
  int count = 100;
  void decrease() {
    count--;
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
            ChangeNotifierProvider(
                create: (context) => PlusCounter(),
            ),
            ChangeNotifierProvider(
                create: (context) => MinusCounter(),
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
    final plus = Provider.of<PlusCounter>(context);
    final minus = Provider.of<MinusCounter>(context);

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Plus: ${plus.count}'
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Minus: ${minus.count}'
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    plus.increase();
                  },
                  child: Text(
                    '+'
                  ),
              ),
              ElevatedButton(
                  onPressed: () {
                    minus.decrease();
                  },
                  child: Text(
                    '-'
                  ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
