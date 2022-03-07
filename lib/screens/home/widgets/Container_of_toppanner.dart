import 'package:flutter/material.dart';

class ContainerOfTopPanner extends StatelessWidget {
  final String? image;
  const ContainerOfTopPanner({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        image: DecorationImage(image: NetworkImage(image!), fit: BoxFit.fill),
      ),
    );
  }
}
