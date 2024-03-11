import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'authenticate.dart';
import 'home_screen.dart';
import 'authentication_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer<UserProvider>(
          builder: (context, user, child) =>
          user.status == Status.authenticated
              ? HomeScreen()
              : AuthenticationScreen(),
        ),
      ),
    );
  }
}



