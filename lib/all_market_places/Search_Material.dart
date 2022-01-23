import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String>{
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6EFDE),
          elevation: 0,
          foregroundColor: Colors.black,

        ),
        primaryColor: Color(0xFFF6EFDE),
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
    'home remodeling'
  ];
  final data2=[
    'ALi',
    'Zafar',
    'Cheena',
  ];
  double ratingValue;
  DataSearch(double ratingV){
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
    return ListView.builder(itemBuilder: (context,index)=>singleCard(
        context,
        ratingBarValue: ratingValue,
        ratingNo: 5,
        imageURL: 'https://media.istockphoto.com/photos/stacked-lumber-and-blueprints-at-a-construction-site-picture-id104294966?k=20&m=104294966&s=612x612&w=0&h=IFfLurqe8SF2iPmmhJZzpIM3Mlg0v-HYkrqc8OQ5CNQ='
        ,storeName: list[index],
        storLocation: "Lonononn"
    ),
      itemCount: list.length,);
    throw UnimplementedError();
  }

}