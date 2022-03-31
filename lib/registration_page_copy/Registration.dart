import 'package:build_i_t/backend/backend.dart';
import 'package:build_i_t/home_page/homepage_header.dart';
import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../FirebaseUser.dart';
import '../authentication_service.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/CustomerHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPageCopyWidget extends StatefulWidget {
  const RegistrationPageCopyWidget({Key key}) : super(key: key);

  @override
  _RegistrationPageCopyWidgetState createState() =>
      _RegistrationPageCopyWidgetState();
}

class _RegistrationPageCopyWidgetState
    extends State<RegistrationPageCopyWidget> {
  String dropDownValue = "Customer";
  TextEditingController FullNameController;
  TextEditingController EmailController;
  TextEditingController PhoneController;
  TextEditingController PasswordController;
  bool passwordVisibility1;
  TextEditingController ConfirmPasswordController;
  String Type = "Customer";
  bool passwordVisibility2;
  AuthenticationService auth = new AuthenticationService(FirebaseAuth.instance);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    FullNameController = TextEditingController();
    EmailController = TextEditingController();
    PhoneController = TextEditingController();
    PasswordController = TextEditingController();
    passwordVisibility1 = false;
    ConfirmPasswordController = TextEditingController();
    passwordVisibility2 = false;
  }

  bool loading = false;
  CollectionReference user = FirebaseFirestore.instance.collection('users');
  Future<void> addUser() {
    return user
        .add({
          'name': FullNameController.text,
          'email': EmailController.text,
          'phone': PhoneController.text,
          'type': dropDownValue
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("User not added $error"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Color(0xFFF6EFDE),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF6EFDE),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFF6EFDE),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: FlutterFlowDropDown(
                    options: ['Customer', 'Vendor', 'Admin'].toList(),
                    onChanged: (val) => (setState(() {
                      dropDownValue = val;
                      Type = val;
                    })),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    textStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    fillColor: Color(0xFF282828),
                    elevation: 2,
                    borderColor: Colors.transparent,
                    borderWidth: 1.5,
                    borderRadius: 0,
                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                    hidesUnderline: true,
                  ),
                ), //user type
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: FullNameController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      hintText: 'Enter your full name',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ), //Full name
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: EmailController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your email!';
                      } else if (!value.contains("@")) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      hintText: 'Enter your email',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ), //Email
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: PhoneController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your phone number!';
                      } else if (value.length < 11) {
                        return 'phone number is not valid';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      hintText: 'Enter your phone number',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.phone,
                  ),
                ), //Phone
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: PasswordController,
                    obscureText: !passwordVisibility1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter password!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility1 = !passwordVisibility1,
                        ),
                        child: Icon(
                          passwordVisibility1
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ), //Password
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                  child: TextFormField(
                    controller: ConfirmPasswordController,
                    obscureText: !passwordVisibility2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter password!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      hintText: 'Enter your password',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF282828),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => passwordVisibility2 = !passwordVisibility2,
                        ),
                        child: Icon(
                          passwordVisibility2
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color(0xFF757575),
                          size: 22,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF282828),
                    ),
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ), //Confirm Password
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                  child: loading
                      ? Lottie.network(
                          'https://assets8.lottiefiles.com/packages/lf20_kxsd2ytq.json',
                          width: 50,
                          height: 50)
                      : FFButtonWidget(
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return null;
                            }
                            setState(() {
                              loading = true;
                            });
                            if (PasswordController.text ==
                                ConfirmPasswordController.text) {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: EmailController.text.trim(),
                                        password:
                                            PasswordController.text.trim());
                                if (FirebaseAuth.instance.currentUser != null) {
                                    scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "Account created successfully!",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor: Colors.lightGreen,
                                    ));

                                    //Storing data to realtime database
                                    addUser();
                                    FullNameController.clear();
                                    EmailController.clear();
                                    PhoneController.clear();
                                    PasswordController.clear();
                                    ConfirmPasswordController.clear();


                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageWidget()));

                                }

                                setState(() {
                                  loading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "weak-password") {
                                  scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Weak password entered!",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.redAccent,
                                  ));
                                  setState(() {
                                    loading = false;
                                  });
                                }
                                if (e.code == "email-already-in-use") {
                                  scaffoldKey.currentState
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      "Account already exist",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.orangeAccent,
                                  ));
                                  setState(() {
                                    loading = false;
                                  });
                                }
                              }
                            } else {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                  "Password and Confirm password doesnot match!",
                                  style: TextStyle(color: Colors.black),
                                ),
                                backgroundColor: Colors.redAccent,
                              ));
                            }


                            //verifyEmail();
                            // await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            //     email: EmailController.text.trim(),
                            //     password: PasswordController.text.trim());
                            // FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text.trim(),
                            //     password: PasswordController.text.trim());
                            // if(FirebaseAuth.instance.currentUser!=null) {
                            //   if (!FirebaseAuth.instance.currentUser
                            //       .emailVerified) {
                            //     Fluttertoast.showToast(msg: "Verification Email Sent!");
                            //     FirebaseAuth.instance.currentUser
                            //         .sendEmailVerification();
                            //     print(Type);
                            //     addUserData(Type.toString(),FullNameController.text.toString(),PhoneController.text.toString());
                            //
                            //   }
                            //   if (FirebaseAuth.instance.currentUser.emailVerified) {
                            //     await Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => LoginPageWidget(),
                            //       ),
                            //     );
                            //   }
                            //}
                          },
                          text: 'Sign Up',
                          options: FFButtonOptions(
                            width: MediaQuery.of(context).size.width,
                            height: 55,
                            color: Color(0xFF282828),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFFB700),
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.5,
                            ),
                            borderRadius: 0,
                          ),
                        ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPageWidget(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: FlutterFlowTheme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
