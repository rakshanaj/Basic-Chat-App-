
import 'chat_screen.dart';
import 'package:basic_chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:basic_chat_app/components/rounded_button.dart';
import 'package:basic_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id= '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FirebaseAuth _auth=FirebaseAuth.instance;
  String email,password;
  bool showSpinner=false;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/pawprint.png'),
                  height: 130.0,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  keyboardType: TextInputType.emailAddress, //gives option of @ in keyboard
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    email=value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter email"
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: 350.0,
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    password=value;
                  },

                  decoration: kTextFieldDecoration.copyWith(
                      hintText: "Enter password"
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(color: Colors.brown.shade700,btn: 'Login',onPressed: () async {
                setState(() {
                  showSpinner=true;
                });
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);

                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  setState(() {
                    showSpinner=false;
                  });
                }
                catch(e){
                  print('check credential and try again');
                }
                },),
              RoundedButton(color: Colors.brown.shade700,btn: 'Forgot password',onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },),
            ],
          ),
        ),
      ),
    );
  }
}
