import 'package:flutter/material.dart';

class ContainerOfWatchPrduct extends StatelessWidget {
  final Widget? widget;
  final String? name;
  final String? text;
  const ContainerOfWatchPrduct({this.name, this.text, this.widget});
  @override
  Widget build(BuildContext context) {
    final high = MediaQuery.of(context).size.height;
    final wigh = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: wigh * .95,
          height: high * .09,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: wigh * .20,
                      height: high * .04,
                      child: widget,
                    ),
                  ),
                  SizedBox(
                    width: wigh * .30,
                    height: high * .03,
                    child: Center(
                      child: Text(
                        name!,
                        style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: wigh * .65,
                height: high * .2,
                child: Center(
                  child: Text(
                    text!,
                    style: TextStyle(
                      fontFamily: 'oswald',
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
