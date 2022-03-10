import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CustomerHomePage.dart';

class stateLogin extends StatelessWidget {
  const stateLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(child:CircularProgressIndicator());
          } else if(snapshot.hasError) {
            return Center(child:Text("Failed To Authenticate"));
          } else if(snapshot.hasData) {
            //Already Logged in State
            return HomePageWidget();
          } else return Center(child:Text("Login To Contiune"));}
    );
  }
}

