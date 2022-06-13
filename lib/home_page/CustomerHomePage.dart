import 'package:build_i_t/Build%20Your%20Home/BuildYourHome_Main.dart';
import 'package:build_i_t/Build%20Your%20Home/phasesPage.dart';
import 'package:build_i_t/MenuBar/menubar_top.dart';
import 'package:build_i_t/VendorServicesModel.dart';
import 'package:build_i_t/all_market_places/Search_Material.dart';
import 'package:build_i_t/all_service_providers/search_serviceProviders.dart';
import 'package:build_i_t/chat_inbox/chatCard.dart';
import 'package:build_i_t/chat_inbox/chatCard.dart';
import 'package:build_i_t/chat_inbox/chatSearch.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:build_i_t/data.dart';
import 'homepage_header.dart';
import 'marketPlaceCard.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //This is the function for Service list extraction
  Future<List> vendor_list = Database.receiveData();
  TextEditingController textController;
  Random random = new Random();
  double ratingBarValue1;
  double ratingBarValue2;
  double ratingBarValue3;
  double ratingBarValue4;
  double ratingBarValue5;
  double ratingBarValue6;
  double ratingBarValue7;
  double ratingBarValue8;
  double ratingBarValue9;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  MediaQueryData size;
  // Obtain shared preferences.
  DatabaseReference _databaseReference;

  int initScreen;
  void initState() {
    super.initState();
    textController = TextEditingController();
    _databaseReference = FirebaseDatabase.instance.ref().child("showScreen");
  }

  final List services = ['Electricion', 'Plumber', 'Carpenter', 'Painter'];
  @override
  Widget build(BuildContext context) {
    Data data = new Data();
    Random random = new Random();
    size = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      drawer: menuBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: homePageHeader(),
              ),
              Column(
                // padding: EdgeInsets.zero,
                // scrollDirection: Axis.vertical,
                children: [
                  //Build Your Home
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _databaseReference.onValue.listen((event) {
                          final data = event.snapshot.value;
                          print(data);
                          if(data==null || data==0){
                            _databaseReference.set(1);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => startingScreen()));
                          }
                          if(data==1){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => phasesPageMain()));
                          }
                        });
                        // _databaseReference.once().then((value) => print(""+value.toString()));

                        if (_databaseReference.child("showScreen").get() == 0) {
                          // preferences.setInt("initScreen", 0);


                        } else if (_databaseReference
                                .child("showScreen")
                                .get() ==
                            1) {

                        }
                        // if(initScreen==0){
                        //   print("na karai Show it");
                        // }
                        //
                        // final prefs = await SharedPreferences.getInstance();
                        //  if(prefs.getBool("isLoad")==true){
                        //   prefs.setBool("isLoad", false);
                        //   prefs.remove("isLoad");
                        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>startingScreen()));
                        //
                        // }
                        // else{
                        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>phasesPageMain()));
                        // }
                      },
                      text: 'Build Your Home',
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        color: Color(0xFFF2F2F2),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF282828),
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


                  //Maekrt Places (Text Row)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(21, 0, 21, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                          child: AutoSizeText(
                            'Market Places',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.title3.override(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: DataSearch(ratingBarValue1));
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                            child: AutoSizeText(
                              'See all',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title3.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF4F4F4F),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Padding(
                  //     padding: EdgeInsets.all(10),
                  //     child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                  //
                  //   ),
                  // ),


                  //GridView Marketplaces
                  // Column(
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [
                  //     //Market Places
                  //
                  //     marketPlaceCard(
                  //         ratingValue: ratingBarValue1,
                  //         ratingNo: random.nextInt(5).toDouble(),
                  //         context: context,
                  //         ImageLink: data.imagesServices().toString(),
                  //         shopName: data.names().toString(),
                  //         shopLocation: "Loney Wala",
                  //         Email: "abc@gmail.com",
                  //         Contact: "+92-13456789",
                  //         HRate: random.nextInt(3000).toString()),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     marketPlaceCard(
                  //         ratingValue: ratingBarValue1,
                  //         ratingNo: random.nextInt(5).toDouble(),
                  //         context: context,
                  //         ImageLink: data.imagesServices().toString(),
                  //         shopName: data.names().toString(),
                  //         shopLocation: "Loney Wala",
                  //         Email: "abc@gmail.com",
                  //         Contact: "+92-13456789",
                  //         HRate: random.nextInt(3000).toString()),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     marketPlaceCard(
                  //         ratingValue: ratingBarValue1,
                  //         ratingNo: random.nextInt(5).toDouble(),
                  //         context: context,
                  //         ImageLink: data.imagesServices().toString(),
                  //         shopName: data.names().toString(),
                  //         shopLocation: "Loney Wala",
                  //         Email: "abc@gmail.com",
                  //         Contact: "+92-13456789",
                  //         HRate: random.nextInt(3000).toString()),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     marketPlaceCard(
                  //         ratingValue: ratingBarValue1,
                  //         ratingNo: random.nextInt(5).toDouble(),
                  //         context: context,
                  //         ImageLink: data.imagesServices().toString(),
                  //         shopName: data.names().toString(),
                  //         shopLocation: "Loney Wala",
                  //         Email: "abc@gmail.com",
                  //         Contact: "+92-13456789",
                  //         HRate: random.nextInt(3000).toString()),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     marketPlaceCard(
                  //         ratingValue: ratingBarValue1,
                  //         ratingNo: random.nextInt(5).toDouble(),
                  //         context: context,
                  //         ImageLink: data.imagesServices().toString(),
                  //         shopName: data.names().toString(),
                  //         shopLocation: "Loney Wala",
                  //         Email: "abc@gmail.com",
                  //         Contact: "+92-13456789",
                  //         HRate: random.nextInt(3000).toString()),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //   ],
                  // ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
