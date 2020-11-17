import 'package:flutter/material.dart';
import '../widget/dialog_search.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class TopBarCompareScreen extends StatefulWidget {
  @override
  _TopBarCompareScreenState createState() => _TopBarCompareScreenState();
}

class _TopBarCompareScreenState extends State<TopBarCompareScreen> {
  var _isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context).fetchandsetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int num1 = DialogSearch.intt;
    int num2 = DialogSearch.intt2;
    final avaliablephoness = Provider.of<Products>(context);
    final phoness = avaliablephoness.items;
    final heightt = MediaQuery.of(context).size.height;
    final weigh = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: weigh * .050,
          right: weigh * .050,
        ),
        child: Container(
          width: double.infinity,
          height: heightt * .25,
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: num1 == null
                    ? Container(
                        child: GestureDetector(
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogSearch();
                                  });
                            },
                            child: Image.asset('assets/images/Group7.png')))
                    : Column(
                        children: [
                          Text(
                            phoness[num1].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Oswald',
                                fontSize: 12),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogSearch();
                                  });
                            },
                            child: Container(
                              height: heightt * .200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          phoness[num1].mainImages),
                                      fit: BoxFit.fitHeight)),
                            ),
                          ),
                        ],
                      ),
              ),
              Flexible(
                  flex: 2,
                  child: Container(
                      child: Image.asset('assets/images/Group 8 (1).png'))),
              Flexible(
                flex: 3,
                child: num2 == null
                    ? Container(
                        child: GestureDetector(
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogSearch();
                                  });
                            },
                            child: Image.asset('assets/images/Group7.png')))
                    : Column(
                        children: [
                          Text(
                            phoness[num2].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Oswald',
                                fontSize: 12),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogSearch();
                                  });
                            },
                            child: Container(
                              height: heightt * .200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          phoness[num2].mainImages),
                                      fit: BoxFit.fitHeight)),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
