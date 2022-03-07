import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../FirebaseUser.dart';
import '../authentication_service.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
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
  String dropDownValue;
  TextEditingController FullNameController;
  TextEditingController EmailController;
  TextEditingController PhoneController;
  TextEditingController PasswordController;
  bool passwordVisibility1;
  TextEditingController ConfirmPasswordController;
  String Type="Customer";
  bool passwordVisibility2;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text("Register"),backgroundColor: Color(0xFFF6EFDE),
      foregroundColor: Colors.black,elevation: 0,),
      backgroundColor: Color(0xFFF6EFDE),
      body: SingleChildScrollView (
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFFF6EFDE),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: FlutterFlowDropDown(
                  options:
                      ['Customer', 'Vendor', 'Service Provider'].toList(),
                  onChanged: (val) => (setState(() {
                    dropDownValue = val;
                    Type=val;
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
              ),//user type
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: TextFormField(
                  controller: FullNameController,
                  obscureText: false,
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
              ),//Full name
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: TextFormField(
                  controller: EmailController,
                  obscureText: false,
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
              ),//Email
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: TextFormField(
                  controller: PhoneController,
                  obscureText: false,
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
              ),//Phone
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: TextFormField(
                  controller: PasswordController,
                  obscureText: !passwordVisibility1,
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
              ),//Password
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
                child: TextFormField(
                  controller: ConfirmPasswordController,
                  obscureText: !passwordVisibility2,
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
              ),//Confirm Password
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: EmailController.text.trim(),
                        password: PasswordController.text.trim());
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailController.text.trim(),
                        password: PasswordController.text.trim());
                    if(FirebaseAuth.instance.currentUser!=null) {
                      if (!FirebaseAuth.instance.currentUser
                          .emailVerified) {
                        Fluttertoast.showToast(msg: "Verification Email Sent!");
                        FirebaseAuth.instance.currentUser
                            .sendEmailVerification();
                        print(Type);
                        addUserData(Type.toString(),FullNameController.text.toString(),PhoneController.text.toString());

                      }
                      if (FirebaseAuth.instance.currentUser.emailVerified) {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPageWidget(),
                          ),
                        );
                      }
                    }
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
                    'back',
                    style: FlutterFlowTheme.bodyText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}