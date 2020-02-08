import 'package:basic_chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore= Firestore.instance;

class ChatScreen extends StatefulWidget {

  static String id= '/chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final msgTextControler=TextEditingController();

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
            MessagesStream(),
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
                      controller: msgTextControler,
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

                      msgTextControler.clear();

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


class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context,snapshot){
        if(snapshot.hasData) {
          final messages=snapshot.data.documents;
          List<MessageBubble> msgBubbleList=[];
          for(var msg in messages){
            final msgText=msg.data['text'];
            final msgSender=msg.data['sender'];

            final msgBubble= MessageBubble(sender: msgSender,text: msgText,);
            msgBubbleList.add(msgBubble);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: msgBubbleList,
            ),
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
    );
  }
}


class MessageBubble extends StatelessWidget {

  final String sender;
  final String text;

  MessageBubble({this.sender, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(sender,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
            ),
          ),
          Material(
            color: Colors.brown.shade300,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(50.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text('$text',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}


