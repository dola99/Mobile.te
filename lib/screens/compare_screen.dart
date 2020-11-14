import 'package:flutter/material.dart';
import '../widget/topofcomparescreen.dart';

class CompareScreen extends StatelessWidget {
  static const routeName = "/Compare_screen";
  @override
  Widget build(BuildContext context) {
 //  final weig = MediaQuery.of(context).size.width;
 //  final high = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              SafeArea(
                child: Text(
                  "Compare",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RobotoCondensed",
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Divider(
                indent: 100,
                color: Theme.of(context).accentColor,
                endIndent: 100,
              ),
              TopBarCompareScreen(),
              SizedBox(
                height: 5,
              ),
              Divider(
                indent: 100,
                color: Theme.of(context).accentColor,
                endIndent: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
