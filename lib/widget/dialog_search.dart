import 'package:flutter/material.dart';
import 'package:mobility/models/product.dart';
import 'package:mobility/providers/compare_screen_provider.dart';
import 'package:mobility/providers/products.dart';
import 'package:provider/provider.dart';

class DialogSearch extends StatefulWidget {
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
  int? id;
  List listid = [];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isSeraching = false;
  }

  @override
  Widget build(BuildContext context) {
    //  final weig = MediaQuery.of(context).size.width;
    final high = MediaQuery.of(context).size.height;
    final phoness = Provider.of<Products>(context).items;
    listproduct = phoness;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 16,
      child: SizedBox(
        height: high * .6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                style:
                    const TextStyle(color: Colors.black, fontFamily: "Owsald"),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
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
              child: _controller.text.isNotEmpty
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
                                  Provider.of<Compare>(context, listen: false)
                                      .addproduct(phoness[i].id, phoness);
                                  Navigator.of(context).pop();
                                  //setState(() {
                                  /*  setState(() {
                                    Navigator.of(context).pushReplacementNamed(
                                        TabsScreens.roouteName,
                                        arguments: TabsScreens.indexpage = 1);
                                  });
                              */
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
                        final listDate = phoness[index].name!;
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
                                  Provider.of<Compare>(context, listen: false)
                                      .addproduct(phoness[i].id, phoness);

                                  Navigator.of(context).pop();
                                  //setState(() {
                                  // Navigator.of(context).pushReplacementNamed(
                                  //   TabsScreens.roouteName,
                                  //     arguments: TabsScreens.indexpage = 1);
                                  // });
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
    setState(() {});
    searchresult.clear();
    listid.clear();
    searchText.toLowerCase();
    for (int i = 0; i < listproduct.length; i++) {
      final datename = listproduct[i].name;
      final dateid = listproduct[i].id;
      if (datename.toString().toLowerCase().contains(searchText)) {
        searchresult = newsearchresult;
        searchresult.add(datename);
        listid.add(dateid);
      }
    }
  }
}
