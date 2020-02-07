import 'package:flutter/material.dart';
import 'package:basic_chat_app/components/rounded_button.dart';
import 'package:basic_chat_app/constants.dart';


class LoginScreen extends StatefulWidget {
  static String id= '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onChanged: (value){
                  //put to fb
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

                onChanged: (value){
                  //put to fb
                },

                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter password"
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(color: Colors.brown.shade700,btn: 'Login',func:LoginScreen.id),
            RoundedButton(color: Colors.brown.shade700,btn: 'Forgot password',func:LoginScreen.id ,),
          ],
        ),
      ),
    );
  }
}
