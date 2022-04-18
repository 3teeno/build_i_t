import 'dart:async';

import 'package:build_i_t/Build%20Your%20Home/phasesPage.dart';
import 'package:build_i_t/home_page/CustomerHomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class startingScreen extends StatefulWidget {
  const startingScreen({Key key}) : super(key: key);

  @override
  State<startingScreen> createState() => _startingScreenState();
}

class _startingScreenState extends State<startingScreen> {
  bool showScreen = false;

  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState

    void func() async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setInt("initScreen", 0);
      print(preferences.getInt("initScreen"));
    }


    setState(() {
      func();
      Timer(
          Duration(seconds: 1),
          () => setState(() {
                loading = false;
              }));
      showScreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? Container(
            color: Color(0xFFF6EFDE),
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.black87,
            )))
        : SafeArea(
            child: showScreen
                ? Scaffold(
                    backgroundColor: Color(0xFFF6EFDE),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset("assets/lottie_animations/homeSplash.json",
                            repeat: true, animate: true),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Have decided you want to build a custom home, but are not sure where to start? We can help answer the tough questions that come along with building your dream custom home.",
                              style: FlutterFlowTheme.bodyText1,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                          child: FFButtonWidget(
                            onPressed: () {
                              setState(() {
                                showScreen = false;
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => phasesPageMain()));
                            },
                            text: 'Next',
                            options: FFButtonOptions(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 45,
                              color: Color(0xFF282828),
                              textStyle: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFB700),
                                fontWeight: FontWeight.normal,
                              ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageWidget(),
                                ),
                              );
                            },
                            child: Text(
                              'Cancel',
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : phasesPageMain());
  }
}
