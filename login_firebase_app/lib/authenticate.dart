import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status {
  uninitialized, authenticated, authenticating, unauthenticated
}

class UserProvider extends ChangeNotifier {
  final FirebaseAuth _auth;
  Status _status;
  User? _user;

  Status get status => _status; // 외부에서는 status로 내부에서는 _status로 리턴
  User? get user => _user; // 외부에서는 user로 내부에서는 _user로 리턴

  UserProvider() // 생성자
      : _auth = FirebaseAuth.instance, // 로그인 상태
        _user = FirebaseAuth.instance.currentUser, // 현재 로그인 유저
        _status = FirebaseAuth.instance.currentUser != null
            ? Status.authenticated
            : Status.unauthenticated {
    _auth.authStateChanges().listen(_onStateChanged);
  }

  Future<String> signUp(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.createUserWithEmailAndPassword( // 회원가입정보 받기
          email: email,
          password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      _status = Status.unauthenticated;
      notifyListeners();
      if (e.message!.contains('weak-password')) {
        return 'The password provided is too weak';
      } else if (e.message!.contains('email-already-in-use')) {
        return 'An account already exists for that email.';
      } else {
        return e.message!;
      }
    } catch(e) {
      return e.toString();
    }
  }

  Future<String> signIn(String email, String password) async {
    try {
      _status = Status.authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      _status = Status.unauthenticated;
      notifyListeners();
      if (e.message!.contains('user-not-found')) {
        return 'No user found for that email';
      } else if (e.message!.contains('wrong-password')) {
        return 'Wrong password provided for that user';
      } else {
        return e.message!;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _status = Status.unauthenticated;
    notifyListeners();
  }

  Future<void> _onStateChanged(User? user) async {
    if(user == null) {
      _status = Status.unauthenticated;
    }else {
      _status = Status.authenticated;
    }
    notifyListeners();
  }
}
