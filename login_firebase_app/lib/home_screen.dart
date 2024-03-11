import 'package:flutter/material.dart';
import 'package:login_firebase_app/authenticate.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen'
        ),
        actions: [
          ElevatedButton.icon(
              onPressed: () async {
                await userProvider.signOut();
              },
              icon: Icon(Icons.logout),
              label: Text(
                "Logout",
              ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome, ${userProvider.user?.email ?? 'Anonymous'}" ,
              // ?? 앞에 null이면 ?? 뒤의 값을 출력
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
