// import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:build_i_t/home_page/serviceProvidersCard.dart';
import 'package:flutter/material.dart';

class search_serviceProviders extends SearchDelegate<String>{
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6EFDE),
          elevation: 0,
          foregroundColor: Colors.black,

        ),
        inputDecorationTheme: new InputDecorationTheme(
            border: InputBorder.none
        )
    );
  }
  final data=[
    'brick',
    'pipes',
    'plumber',
    'construction companies',
    'home remodeling',

  ];
  final data2=[
    'ALi',
    'Zafar',
    'Cheena',
  ];
  double ratingValue;
  search_serviceProviders(double ratingV){
    ratingValue=ratingV;
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query="";
      }, icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(
      Icons.arrow_back,

    ));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list=query.isEmpty? data:data.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
    print(data);
    return GridView.count(crossAxisCount: 2,children: List.generate(list.length, (index) => serviceProvidersCard(ratingNo: 5,ratingBarValue: ratingValue,serviceProviderName: list[index],serviceProviderCatagory: "plumber",imageURL: "https://images.unsplash.com/photo-1569496736555-47c448d556f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80")));
    throw UnimplementedError();
  }

}