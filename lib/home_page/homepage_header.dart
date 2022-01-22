import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_widgets.dart';
import 'package:build_i_t/search_page/search_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homePageHeader extends StatefulWidget {
  const homePageHeader({Key key}) : super(key: key);

  @override
  _homePageHeaderState createState() => _homePageHeaderState();
}

class _homePageHeaderState extends State<homePageHeader> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: 125,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF282828),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: AlignmentDirectional(-1, 0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.7, -0.8),
                    child: Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/BuildIt_V002.png',
                        width: 130,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.9, -0.6),
                    child: InkWell(
                      onTap: () async {
                        scaffoldKey.currentState.openDrawer();
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        color: Color(0xFFF6EFDE),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.9, -0.4),
          child: Lottie.network(
            'https://assets1.lottiefiles.com/packages/lf20_LqA9yY.json',
//            'https://assets3.lottiefiles.com/packages/lf20_zJLfwG.json',
            width: 130,
            height: 110,
            fit: BoxFit.cover,
            animate: true,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 0.95),
                child: Padding(
                  padding:
                  EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                  child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Search',
                      hintStyle: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFC4C4C4),
                        fontStyle: FontStyle.italic,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF282828),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          20, 30, 0, 0),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFC4C4C4),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.15, 0.9),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    MaterialPageRoute(
                      builder: (context) =>SearchPageWidget(),
                    );
                  },

                  text: '',
                  icon: Icon(
                    Icons.search,
                    color: Color(0xFF212121),
                    size: 20,
                  ),
                  options: FFButtonOptions(
                    width: 55,
                    // padding: EdgeInsetsDirectional.fromSTEB(20, 0, 5, 0),
                    height: 50,
                    color: Color(0xFFF4BB03),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}