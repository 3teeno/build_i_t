import 'package:build_i_t/chat_inbox/chatSearch.dart';
import 'package:flutter/cupertino.dart';

import '../data.dart';
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
  Data data= new Data();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    List data1=data.chatnames();
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
            child: ListView.builder(itemBuilder: (context,index)=>
                chatCard(context,
                    name: data1[index],
                    text:"Helloo...",
                    imageURL: data.imagesPerson()
                ),
              itemCount: data1.length,),
          ),
        ],
      ),
    );
  }
}
