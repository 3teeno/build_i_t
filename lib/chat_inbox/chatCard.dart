import 'package:auto_size_text/auto_size_text.dart';
import 'package:build_i_t/chat_inbox/SingleChatScreen.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/material.dart';

Widget chatCard(BuildContext context,{String name,String text,String imageURL}){
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(10, 2, 10, 3),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => singleChat(),
                ),
              );
            },
            child: Row(

              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          8, 8, 8, 8),
                      child: Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.fill,
                          //'https://picsum.photos/seed/878/600',
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          //'Name Here',
                          style: FlutterFlowTheme.title3
                              .override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF282828),
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(
                              0, 0, 10, 0),
                          child: AutoSizeText(
                            text,
                            //'Lorem Ipsum is simply dummy',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}