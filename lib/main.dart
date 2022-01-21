import 'package:build_i_t/authentication_service.dart';
import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:build_i_t/home_page/home_page_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//Hello mateen
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance)
    ),
    StreamProvider(
      create: (context) => context.read<AuthenticationService >().authStateChanges,
    ),
    ],
    child: MaterialApp(
      title: 'BuildIT',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPageWidget(),
    ));
  }
}
class AuthenticationWraper extends StatelessWidget
{
  AuthenticationWraper({Key key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser!=null)
      {
        return HomePageWidget();
      }
    else
      {
        Fluttertoast.showToast(msg: "Invalid Username or Password");
        return LoginPageWidget();
      }

  }
  
}