import 'package:flutter/material.dart';
import 'package:basic_chat_app/components/rounded_button.dart';
import 'package:basic_chat_app/constants.dart';

class RegistrationScreen extends StatefulWidget {

  static String id= '/regististration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag:'logo',
              child: Container(
                child: Image.asset('images/pawprint.png'),
                height: 100.0,
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
                onPressed: (){
                  print(email);
                  print(password);
                },

            ),

          ],
        ),
      ),
    );
  }
}
