import 'package:auto_size_text/auto_size_text.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_theme.dart';
import 'package:build_i_t/flutter_flow/flutter_flow_util.dart';
import 'package:build_i_t/market_place/Vendor_Gig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//Service Provider
Widget serviceProvidersCard(
BuildContext context,
    {double ratingBarValue,
    double ratingNo,
    String serviceProviderName,
    String serviceProviderCatagory,
    String imageURL}) {
  return InkWell(
    onTap: () async {
      await Navigator.push(context, PageTransition(child: MarketPlaceWidget(materialName: serviceProviderName,Contact: "123456",Email: "123465",HRate: "123456",imgaeURL: imageURL,), type: PageTransitionType.scale,
          alignment: Alignment.bottomCenter,duration: Duration(milliseconds: 300),reverseDuration: Duration(milliseconds: 300)));
    },
    child: Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 2, 10),
      child: Container(
        width: 120,
        height: 150,
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 5),
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
//                  'https://i.pravatar.cc/150?img=51',
                  ),
                ),
              ),
              AutoSizeText(
                serviceProviderName,
//              'Person Name',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              AutoSizeText(
                serviceProviderCatagory,
                //'Contractor',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 8,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 2, 0, 0),
                child: RatingBar.builder(
                  // onRatingUpdate: (newValue) => setState(
                  //         () => ratingBarValue6 = newValue),
                  itemBuilder: (context, index) => Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFB700),
                  ),
                  direction: Axis.horizontal,
                  initialRating: ratingBarValue ??= ratingNo,
                  unratedColor: Color(0xFF9E9E9E),
                  itemCount: 5,
                  itemSize: 10,
                  glowColor: Color(0xFFFFB700),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
