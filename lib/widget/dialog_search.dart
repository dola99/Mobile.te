import 'package:flutter/material.dart';
import 'package:mobility/providers/product.dart';
import 'package:mobility/screens/tabs-screens.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class DialogSearch extends StatefulWidget {
  static int intt;
  static int intt2;
  @override
  _DialogSearchState createState() => _DialogSearchState();
}

class _DialogSearchState extends State<DialogSearch> {
  final TextEditingController _controller = TextEditingController();
  List searchresult = [];
  List newsearchresult = [];
  bool isSeraching = true;

  List<Product> listproduct = [];
  List<Product> listproductchoosen = [];
  int id;
  List listid = [];
  var _isInit = true;
  var isLoading = false;

  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Products>(context, listen: false)
          .fetchandsetProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isSeraching = false;
  }

  @override
  Widget build(BuildContext context) {
    //  final weig = MediaQuery.of(context).size.width;
    final high = MediaQuery.of(context).size.height;
    final availablePhones = Provider.of<Products>(context);
    final phoness = availablePhones.items;
    listproduct = phoness;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 16,
      child: Container(
        height: high * .6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                style: TextStyle(color: Colors.black, fontFamily: "Owsald"),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: "Search.....!",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
                onChanged: searchOpreation,
              ),
            ),
            Flexible(
              child: searchresult.length != 0 || _controller.text.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsearchresult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            '${newsearchresult[index]}',
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < phoness.length; i++) {
                                if (phoness[i].id == listid[index]) {
                                  if (DialogSearch.intt == null) {
                                    DialogSearch.intt = i;
                                  } else {
                                    DialogSearch.intt2 = i;
                                  }
                                  setState(() {
                                    Navigator.of(context).pushReplacementNamed(
                                        TabsScreens.roouteName,
                                        arguments: TabsScreens.indexpage = 1);
                                  });
                                }
                              }
                            });
                          },
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        String listDate = phoness[index].name;
                        return ListTile(
                          title: Text(
                            listDate,
                            textAlign: TextAlign.center,
                            maxLines: 5,
                          ),
                          onTap: () {
                            setState(() {
                              for (int i = 0; i < phoness.length; i++) {
                                if (phoness[i].id == phoness[index].id) {
                                  if (DialogSearch.intt == null) {
                                    DialogSearch.intt = i;
                                  } else {
                                    DialogSearch.intt2 = i;
                                  }
                                  setState(() {
                                    Navigator.of(context).pushReplacementNamed(TabsScreens.roouteName,arguments: TabsScreens.indexpage=1);
                                  });
                                }
                              }
                            });
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  void searchOpreation(String searchText) {
    searchresult.clear();
    listid.clear();
    searchText = searchText.toLowerCase();
    for (int i = 0; i < listproduct.length; i++) {
      var datename = listproduct[i].name;
      var dateid = listproduct[i].id;
      if (datename.toString().toLowerCase().contains(searchText)) {
        searchresult = newsearchresult;
        searchresult.add(datename);
        listid.add(dateid);
      }
    }
  }
}
