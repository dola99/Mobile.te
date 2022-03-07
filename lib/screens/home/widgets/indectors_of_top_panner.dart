import 'package:flutter/material.dart';

import 'package:mobility/screens/home/widgets/container_of_toppanner.dart';

class AndictorOfTopPanner extends StatelessWidget {
  final int? currentPage;
  final String? image;
  final int? productlenth;
  const AndictorOfTopPanner({this.currentPage, this.image, this.productlenth});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
          child: ContainerOfTopPanner(image: image),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: List<Widget>.generate(
                  productlenth!,
                  (int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 10,
                      width: (index == currentPage) ? 30 : 10,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == currentPage)
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).buttonColor,
                      ),
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
