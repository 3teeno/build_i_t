import 'package:build_i_t/backend/backend.dart';

import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:build_i_t/main.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../authentication_service.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/Forgot Password/ForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:build_i_t/registration_page/Registration.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Google_signIn.dart';

class logIn extends StatefulWidget {
  const logIn({Key key}) : super(key: key);

  @override
  _logInState createState() => _logInState();
}

class _logInState extends State<logIn> {
  String dropDownValue;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  bool loading = false;
  bool execution = false;

  Login() async {}
  Future<bool> hasUserLogged() async {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
            key: scaffoldKey,
            backgroundColor: Color(0xFFFFFFFF),
            body: Stack(
              children: [Expanded(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 20),
                            child: Image.asset(
                              'assets/images/welcome.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                          //   child: FlutterFlowDropDown(
                          //     options: ['Customer', 'Vendor', 'Admin'].toList(),
                          //     onChanged: (val) =>
                          //         setState(() => dropDownValue = val),
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 60,
                          //     textStyle: FlutterFlowTheme.bodyText1.override(
                          //       fontFamily: 'Poppins',
                          //       color: Colors.white,
                          //     ),
                          //     fillColor: Color(0xFF282828),
                          //     elevation: 2,
                          //     borderColor: Colors.transparent,
                          //     borderWidth: 1.5,
                          //     borderRadius: 0,
                          //     margin:
                          //         EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          //     hidesUnderline: true,
                          //   ),
                          // ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 12, 30, 0),
                            child: TextFormField(
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter email!';
                                } else if (!value.contains("@")) {
                                  return 'Please enter valid email!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Email',
                                labelStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  lineHeight: 2,
                                ),
                                hintText: 'Enter email',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  lineHeight: 2,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF282828),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF282828),
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF282828),
                                lineHeight: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 12, 30, 0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisibility,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter password!';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Password',
                                labelStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  lineHeight: 2,
                                ),
                                hintText: 'Enter password',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF282828),
                                  lineHeight: 2,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF282828),
                                    width: 1.5,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF282828),
                                    width: 1.5,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () =>
                                        passwordVisibility = !passwordVisibility,
                                  ),
                                  child: Icon(
                                    passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF282828),
                                    size: 22,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF282828),
                                lineHeight: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 12, 30, 0),
                            child: loading
                                ? Lottie.network(
                                    'https://assets8.lottiefiles.com/packages/lf20_kxsd2ytq.json',
                                    width: 50,
                                    height: 50,
                                    repeat: true)
                                : FFButtonWidget(
                                    onPressed: () async {
                                      if (!_formKey.currentState.validate()) {
                                        return null;
                                      }
                                      // setState(() {
                                      //   loading = true;
                                      // });
                                      if(FirebaseAuth.instance.currentUser.emailVerified){
                                        scaffoldKey.currentState.showSnackBar(SnackBar(duration: Duration(milliseconds: 10000),content: Text("Email is verified")));
                                      }
                                      try {
                                        scaffoldKey.currentState.showSnackBar(SnackBar(duration: Duration(milliseconds: 10000),content: Text("Email is verified")));
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email:
                                                    emailController.text.trim(),
                                                password: passwordController.text
                                                    .trim());
                                        scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Logged In Successfully!')));

                                        //check which user login
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePageWidget()));
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == "user-not-found") {
                                          scaffoldKey.currentState.showSnackBar(
                                              SnackBar(
                                                  content:
                                                      Text('No user found')));
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                        if (e.code == "wrong-password") {
                                          scaffoldKey.currentState.showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Wrong password entered')));
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      }
                                    },
                                    text: 'Sign In',
                                    options: FFButtonOptions(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      color: Color(0xFF282828),
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFFFB700),
                                      ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 0,
                                    ),
                                  ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration: Duration(milliseconds: 300),
                                    child: RegistrationPageWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                    reverseDuration: Duration(milliseconds: 300),
                                    child: RegistrationPageCopyWidget(),
                                  ),
                                );
                              },
                              child: Text(
                                'Create new account',
                                style: FlutterFlowTheme.title2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Positioned(bottom: -550,left: -100,child: Align(alignment: Alignment.bottomCenter,child: Lottie.asset("assets/lottie_animations/blob01.json"),),)
              //Positioned.fill(child: Align(alignment: Alignment.bottomCenter,child: Text("holla"),))



              ]
            )),
      ),
    );
  }
}
