import 'package:basic_chat_app/components/rounded_button.dart';
import 'package:basic_chat_app/constants.dart';
import 'package:basic_chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {

  static String id= '/regististration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/pawprint.png'),
                    height: 100.0,
                  ),
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
                    //put to fb
                    email=value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter email",
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
                    //put to fb
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
              RoundedButton(
                  color: Colors.brown.shade900,
                  btn: 'Register',
                  onPressed: () async {
//                print(email);
//                print(password);
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      final newUser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(newUser!=null){
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        showSpinner=false;
                      });
                    }
                    catch(e){
                      print(e);
                      print('not able to add new user');
                    }
                  },

              ),

            ],
          ),
        ),
      ),
    );
  }
}
