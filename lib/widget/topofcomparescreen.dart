import 'package:flutter/material.dart';
import '../widget/dialog_search.dart';

class TopBarCompareScreen extends StatefulWidget {
  @override
  _TopBarCompareScreenState createState() => _TopBarCompareScreenState();
}

class _TopBarCompareScreenState extends State<TopBarCompareScreen> {
  @override
  Widget build(BuildContext context) {
    final heightt = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Container(
          width: double.infinity,
          height: heightt * .2,
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return DialogSearch();
                        });
                  },
                  child: Image.asset('assets/images/Group7.png')),
              Image.asset('assets/images/Group 8 (1).png'),
              GestureDetector(
                  onTap: () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return DialogSearch();
                        });
                  },
                  child: Image.asset('assets/images/Group7.png')),
            ],
          ),
        ),
      ),
    );
  }
}
