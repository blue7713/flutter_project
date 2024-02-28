import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.ltr,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              child: Image.asset('assets/images/CSBaseFun.png',
              width: 200, height: 200, fit: BoxFit.contain,),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              child: Image.asset('assets/images/CSBaseFun.png',
                width: 200, height: 200, fit: BoxFit.fill,),
            ),
          ],
        ),
        Row(textDirection: TextDirection.ltr,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Image.asset('assets/images/CSBaseFun.png',
            width: 200, height: 200, fit: BoxFit.fitWidth,),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.red,
                width: 2,
              ),
            ),
            child: Image.asset('assets/images/CSBaseFun.png',
              width: 200, height: 200, fit: BoxFit.fitHeight,),
          ),
        ],),
        Row(textDirection: TextDirection.ltr,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              child: Image.asset('assets/images/CSBaseFun.png',
                width: 200, height: 200, fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              child: Image.asset('assets/images/CSBaseFun.png',
                width: 200, height: 200, fit: BoxFit.none,),
            ),
          ],)
      ],
    );
  }
}
