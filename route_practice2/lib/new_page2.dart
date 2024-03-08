import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  final String message;
  const NewPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(message),
          onPressed: () {
            Navigator.pop(context, 'From NewPage');
          },
        ),
      ),
    );
  }
}
