import 'package:flutter/material.dart';

import 'Container_of_toppanner.dart';

class AndictorOfTopPanner extends StatelessWidget {
  final int currentPage;
  final String image;
  final int productlenth;
  AndictorOfTopPanner({this.currentPage, this.image, this.productlenth});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: ContainerOfTopPanner(image: image),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 8, bottom: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(
                  productlenth,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == currentPage)
                              ? Theme.of(context).accentColor
                              : Theme.of(context).buttonColor),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
