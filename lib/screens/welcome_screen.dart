import 'package:basic_chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:basic_chat_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {

  static String id= '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller=AnimationController(
      duration: Duration(milliseconds:600 ),
      vsync: this,
    );

    controller.forward();
    controller.addListener((){
      setState(() {

      });
      print(controller.value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100.withOpacity(controller.value),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/pawprint.png'),
                  height: 45.0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'ZoeyChats',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),

          SizedBox(
            height: 30.0,
          ),
          RoundedButton(color: Colors.brown.shade600,btn: 'Login',onPressed: (){
            Navigator.pushNamed(context, LoginScreen.id);
          },),
          RoundedButton(color: Colors.brown.shade900,btn: 'Register',onPressed: (){
            Navigator.pushNamed(context, RegistrationScreen.id);
          },),
        ],
      ),
    );
  }
}

