import 'dart:ffi';

import 'package:build_i_t/VendorServicesModel.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_drop_down.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/home_page/home_page_widget.dart';
import 'package:build_i_t/login_page/login_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class Services_CRUD extends StatefulWidget {
  const Services_CRUD({Key key}) : super(key: key);

  @override
  _Services_CRUDState createState() => _Services_CRUDState();
}

class _Services_CRUDState extends State<Services_CRUD> {
  //This is the function for Service list extraction
  Future<List> vendor_list = Database.receiveData();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String dropDownValue;
  TextEditingController Service_Name=new TextEditingController();
  TextEditingController Service_Description;
  TextEditingController Service_HourlyRate;
  TextEditingController Service_Category;
  String task;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Service_Name=new TextEditingController();
    Service_Description=new TextEditingController();
    Service_HourlyRate=new TextEditingController();
    Service_Category=new TextEditingController();
    task='New Service';

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF6EFDE),
      body: SingleChildScrollView (
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: 60,
              ),
              decoration: BoxDecoration(
                color: Color(0x00282828),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF282828),
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: Text(
                      'My Services',
                      style: FlutterFlowTheme.title2.override(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0xFFF6EFDE),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowDropDown(
                    options:
                    ['New Service', 'Update Service', 'Delete Service'].toList(),
                    onChanged: (val) => setState(() {
                      dropDownValue = val;
                      task=val;
                    }),
                    width: 275,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 15, 50, 0),
                    child: TextFormField(
                      controller: Service_Name,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Service Name',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF282828),
                        ),
                        hintText: 'Enter Name For Your Service',
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 15, 50, 0),
                    child: TextFormField(
                      controller: Service_Description,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Service Description',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF282828),
                        ),
                        hintText: 'Describe your Service',
                        hintStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF5D5E5F),
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 15, 50, 0),
                    child: TextFormField(
                      controller: Service_HourlyRate,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Hourly Rate',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF282828),
                        ),
                        hintText: 'Enter your hourly Rate',
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 15, 50, 0),
                    child: TextFormField(
                      controller: Service_Category,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Category',
                        labelStyle: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF282828),
                        ),
                        hintText: 'Type (Cleaning,Repairing,Maintenance)',
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
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        if(task == "New Service")
                        {
                          Database.addItem(
                              Service_Name: Service_Name.text.toString(),
                              Service_Description: Service_Description.text.toString(),
                              Service_HourlyRate: Service_HourlyRate.text.toString(),
                              Service_Category: Service_Category.text.toString());
                        }
                        else if (task =="Update Service")
                        {
                          // Database.updateItem(
                          //     Service_Name: Service_Name.text.toString(),
                          //     Service_Description: Service_Description.text.toString(),
                          //     Service_HourlyRate: Service_HourlyRate.text.toString(),
                          //     Service_Category: Service_Category.text.toString());
                        }
                        else {
                          Database.deleteItem(docId : auth.currentUser.uid);
                        }
                      },
                      text: 'Submit',
                      options: FFButtonOptions(
                        width: 275,
                        height: 45,
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
                      onTap: () {

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
          ],
        ),
      ),
    );

  }

}

