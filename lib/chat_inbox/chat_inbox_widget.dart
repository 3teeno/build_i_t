import 'package:build_i_t/chat_inbox/chatSearch.dart';
import 'package:flutter/cupertino.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../navigationto_chat/navigationto_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chatCard.dart';

class ChatInboxWidget extends StatefulWidget {
  const ChatInboxWidget({Key key}) : super(key: key);

  @override
  _ChatInboxWidgetState createState() => _ChatInboxWidgetState();
}

class _ChatInboxWidgetState extends State<ChatInboxWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List data1=[
    'ALi',
    'Mateen',
    'Jundi',
    'Dany Alexa'
  ];
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text("Messages"),
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
          showSearch(context: context, delegate: chatSearch(data1));
        }, icon: Icon(Icons.search))
      ],
      foregroundColor: Colors.black,
      backgroundColor: Color(0xFFF6EFDE),),
      backgroundColor: Color(0xFFF6EFDE),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context,index)=>chatCard(context,name: data1[index],text:"Text Here",imageURL: "https://images.unsplash.com/photo-1603482635787-c6e3f4e18215?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=450&q=80"),itemCount: data1.length,),
          ),
        ],
      ),
    );
  }
}
