import 'package:flutter/material.dart';

class BallOfMatrerial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wights = MediaQuery.of(context).size.width;
    return Container(
      width: wights * .070,
      height: height * .030,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(251, 248, 248, 0.4699999988079071),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}
