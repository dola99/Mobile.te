import 'package:flutter/material.dart';

class CenterCompare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .08,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .010,
            height: MediaQuery.of(context).size.height * .15,
            color: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .090,
            height: MediaQuery.of(context).size.height * .04,
            child: Text(
              "Vs",
              style: TextStyle(
                color: Theme.of(context).dividerColor,
                fontFamily: 'Oswald',
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .010,
            height: MediaQuery.of(context).size.height * .15,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
