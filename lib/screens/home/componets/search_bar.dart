import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobility/widget/dialog_for_search.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        return showDialog(
          context: context,
          builder: (context) {
            return DialogForSearch();
          },
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(350),
        height: ScreenUtil().setHeight(35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromRGBO(196, 196, 196, .5),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
            const VerticalDivider(
              color: Colors.white,
              indent: 5,
              endIndent: 5,
            ),
            const Text(
              "Search by Name Product..",
            ),
          ],
        ),
      ),
    );
  }
}
