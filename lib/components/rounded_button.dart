import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  Color color;
  String btn;
  var func;

  RoundedButton({this.color,this.btn,this.func});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        child: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, func);
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            btn,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
