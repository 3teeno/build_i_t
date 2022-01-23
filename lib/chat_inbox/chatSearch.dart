import 'package:build_i_t/all_market_places/singleCardDesign.dart';
import 'package:build_i_t/chat_inbox/chatCard.dart';
import 'package:flutter/material.dart';

class chatSearch extends SearchDelegate<String>{
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
  List data;

  chatSearch(List data1){
    data=data1;
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
    return ListView.builder(itemBuilder: (context,index)=>chatCard(context,name: list[index],text: "Text",imageURL: "https://images.unsplash.com/photo-1603482635787-c6e3f4e18215?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=450&q=80"),
      itemCount: list.length,);
    throw UnimplementedError();
  }

}