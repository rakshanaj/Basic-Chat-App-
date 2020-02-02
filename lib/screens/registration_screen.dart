import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {

  static String id= '/regististration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 350.0,
              child: TextField(
                onChanged: (value){
                  //put to fb
                },
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown.shade200,width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.brown.shade200,width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
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

                decoration: InputDecoration(
                  hintText: 'Enter pwd',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown.shade200,width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.brown.shade200,width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Material(
              elevation: 5.0,
              color: Colors.brown.shade700,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(onPressed: (){

              },
              child: Text(
                'Register'
              ),
                minWidth: 200.0,
              ),

            ),
          ],
        ),
      ),
    );
  }
}
