import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JustCheckingFirebaseUser {
  JustCheckingFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

JustCheckingFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JustCheckingFirebaseUser> justCheckingFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<JustCheckingFirebaseUser>(
            (user) => currentUser = JustCheckingFirebaseUser(user));
