import 'package:flutter/material.dart';
import 'package:login_firebase_app/authenticate.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String message = '';
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Firebase Auth Demo',
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',

                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        String result = await userProvider.signUp(
                            _emailController.text, _passwordController.text
                        );
                        setState(() {
                          // message = result == 'Success'
                          //     ? 'Sign up Succeed. Please sign in'
                          //     : result;
                          if(result == 'Success') {
                            message = '';
                          } else {
                            message = result;
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String result = await userProvider.signIn(
                          _emailController.text, _passwordController.text
                      );
                      setState(() {
                        // message = result == 'Success'
                        //     ? 'Sign up Succeed. Please sign in'
                        //     : result;
                        if(result == 'Success') {
                          message = '';
                        } else {
                          message = result;
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
