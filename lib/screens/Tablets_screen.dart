import 'package:flutter/material.dart';

class TabletsScreen extends StatelessWidget {
  static const routeName = '/Tablets_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(2.123234262925839e-17, 2),
              end: Alignment(-5.4, 2.123234262925839e-12),
              colors: [
                Color.fromRGBO(255, 189, 89, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(255, 189, 89, 1),
                Color.fromRGBO(0, 0, 0, 1),
              ]),
        ),
      ),
    );
  }
}
