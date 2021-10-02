import 'package:flutter/material.dart';
import 'package:mobility/models/categorey.dart';
import 'package:mobility/providers/categorys.dart';
import 'package:mobility/providers/compare_screen_provider.dart';
import 'package:mobility/models/product.dart';
import 'package:mobility/providers/products.dart';
import 'package:mobility/screens/product/product_detail_screen.dart';
import 'package:provider/provider.dart';

class DialogForSearch extends StatefulWidget {
  @override
  _DialogForSearchState createState() => _DialogForSearchState();
}

class _DialogForSearchState extends State<DialogForSearch> {
  final TextEditingController _controller = TextEditingController();
  List searchresult = [];
  List newsearchresult = [];
  bool isSeraching = true;
  int index;
  int indexcategory;
  List<Product> listproduct = [];
  List<Product> listproductchoosen = [];
  int id;
  List listid = [];

  var isLoading = false;

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
                                if (phoness[i].id == phoness[index].id) {
                                  fetshItem(
                                      phoness[i].id,
                                      Provider.of<Categorys>(context,
                                              listen: false)
                                          .itemss,
                                      Provider.of<Products>(context,
                                              listen: false)
                                          .items);
                                  Provider.of<Compare>(context, listen: false)
                                      .SearchProduct(phoness[i].id, phoness);

                                  Navigator.of(context).pop();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                        product: Provider.of<Compare>(context)
                                            .searchbar,
                                        logo: Provider.of<Categorys>(context,
                                                listen: false)
                                            .itemss[indexcategory]
                                            .logo,
                                      ),
                                    ),
                                  );

                                  //     arguments: TabsScreens.indexpage = 1);
                                  //
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
                                  fetshItem(
                                      phoness[i].id,
                                      Provider.of<Categorys>(context,
                                              listen: false)
                                          .itemss,
                                      Provider.of<Products>(context,
                                              listen: false)
                                          .items);
                                  Provider.of<Compare>(context, listen: false)
                                      .SearchProduct(phoness[i].id, phoness);
                                  Provider.of<Compare>(context, listen: false)
                                      .SearchProduct(phoness[i].id, phoness);

                                  Navigator.of(context).pop();

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                        product: Provider.of<Compare>(context)
                                            .searchbar,
                                        logo: Provider.of<Categorys>(context,
                                                listen: false)
                                            .itemss[indexcategory]
                                            .logo,
                                      ),
                                    ),
                                  );

                                  //     arguments: TabsScreens.indexpage = 1);
                                  //
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

  void fetshItem(String id, List<Category> list2, List<Product> list1) {
    List<Product> n = list1;
    List<Category> a = list2;
    for (int k = 0; k <= 100; k++) {
      if (id == n[k].id) {
        print(n[k].name);
        index = k;
        break;
      }
    }
    for (int t = 0; t < a.length; t++) {
      if (n[index].category == a[t].name) {
        indexcategory = t;
        break;
      }
    }
  }
}
