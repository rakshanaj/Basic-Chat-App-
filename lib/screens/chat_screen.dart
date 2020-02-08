import 'package:basic_chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {

  static String id= '/chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _firestore= Firestore.instance;
  final _auth=FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  String msgText;

  void getCurrentUser() async{
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print('not able to get user that is logged in');
    }
  }

  void messageStream() async{
    print("getting messages from db");
    await for(var ss in _firestore.collection('messages').snapshots()){
      for(var msg in ss.documents){
        print(msg.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              //logout
//              _auth.signOut();
//              print('logged out');

            messageStream();

              //Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
        title: Text('Zoey Chats'),
        backgroundColor: Colors.brown.shade500,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('messages').snapshots(),
                builder: (context,snapshot){
                  if(snapshot.hasData) {
                    final messages=snapshot.data.documents;
                    List<Text> msgWidgets=[];
                    for(var msg in messages){
                      final msgText=msg.data['text'];
                      final msgSender=msg.data['sender'];

                      final msgWidget=Text('$msgText from $msgSender');
                      msgWidgets.add(msgWidget);
                    }
                    return Column(
                      children: msgWidgets,
                    );
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.brown.shade400,
                      ),
                    );
                  }
                },
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.brown.shade200, width: 2.0),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value){
                        //user input
                        msgText=value;
                      },
                      decoration:InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      //send
                      _firestore.collection('messages').add({
                        'text':msgText,
                        'sender': loggedInUser.email,
                      });
                      print('sent msg and sender to fb');
                    },
                    child: Text('send'),
                  )
                ],
              ),
            ),

          ],
        ),

      ),
    );
  }
}

