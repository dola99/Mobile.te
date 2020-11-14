import 'package:mobility/widget/flat_buttons.dart';

import '../widget/new_phone_item.dart';
import 'package:flutter/material.dart';
import '../widget/page_view_topbanner.dart';

class HomePage extends StatefulWidget {
  static const routeName = "Home_screen";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                height: height * .320,
                child: PageviewBanner(),
              ),
            ),
            SizedBox(
              height: 1,
            ),
            Center(
              child: Text(
                "_______",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(child: FlatButtons()),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                "Recenty : ",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 30),
                        child: NewPhones(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,bottom: 30),
                        child: NewPhones(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 30),
                        child: NewPhones(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8,bottom: 30),
                        child: NewPhones(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8,bottom: 30),
                        child: NewPhones(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0,bottom: 30),
                        child: NewPhones(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
