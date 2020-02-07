import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  Color color;
  String btn;
  var onPressed;

  RoundedButton({this.color,this.btn,this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: color,
        child: MaterialButton(
          onPressed: onPressed,
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

