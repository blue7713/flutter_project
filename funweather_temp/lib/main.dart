import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Weather App',
          style: TextStyle(
            color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.lightBlue],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_sunny,
                  size: 100,
                  color: Colors.yellow,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("27℃",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("sunny",
                style: TextStyle(
                  fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("New York City, USA",
                style: TextStyle(
                  fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Humidity'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('50%',
                          style: TextStyle(
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Wind'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('12 Km/h',
                          style: TextStyle(
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Pressure'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('1023 hPa',
                          style: TextStyle(
                              fontSize: 20),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
