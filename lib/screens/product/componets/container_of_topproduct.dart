import 'package:flutter/material.dart';

class TopProduct extends StatelessWidget {
  final String? name;
  final String? namecompany;
  final String? price;
  final String? mainimage;
  final List<String>? allimages;
  const TopProduct({
    this.name,
    this.allimages,
    this.mainimage,
    this.namecompany,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    final wight = MediaQuery.of(context).size.width;
    final hight = MediaQuery.of(context).size.height;
    return Container(
      height: hight * .35,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: hight * .05,
            left: wight * .05,
            child: Text(
              "$namecompany",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Oswald',
              ),
            ),
          ),
          Positioned(
            left: wight * .09,
            top: hight * .09,
            child: Text(
              '$name',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Oswald',
              ),
            ),
          ),
          Positioned(
            top: hight * .125,
            left: wight * .35,
            child: Text(
              '$price L.e',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontFamily: 'Oswald',
              ),
            ),
          ),
          Positioned(
            right: wight * .15,
            child: Container(
              width: wight * .3,
              height: hight * .33,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.ibb.co/yhQ5GyC/huawei-y9a-8gb-128gb-space-silver-2-1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 2,
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.arrow_drop_up_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            top: hight * .045,
            right: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: hight * .06,
                    width: wight * .140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: hight * .06,
                    width: wight * .140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: hight * .06,
                    width: wight * .140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: hight * .06,
                    width: wight * .140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 2,
            child: IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.arrow_drop_down_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
