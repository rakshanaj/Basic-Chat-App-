import 'package:basic_chat_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {

  static String id= '/welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('images/pawprint.png'),
                height: 60.0,
              ),

            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'ZoeyChats',
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              color: Colors.brown.shade500,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    }
                  ));
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Log in',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.brown.shade900,
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RegistrationScreen();
                  }));
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Register',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
