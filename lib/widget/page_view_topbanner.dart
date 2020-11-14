import 'package:flutter/material.dart';
import '../providers/topbanners.dart';
import 'package:provider/provider.dart';

class PageviewBanner extends StatefulWidget {
  @override
  _PageviewBannerState createState() => _PageviewBannerState();
}

class _PageviewBannerState extends State<PageviewBanner> {
  int _currentPage = 0;
  var _isInit = true;
  var isLoading = false;
  PageController _pagecontroller;

  void _onscroll() {}

  @override
  void initState() {
    _pagecontroller = PageController(initialPage: 0, viewportFraction: 1)
      ..addListener(_onscroll);
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Topbanners>(context).fetchAndSetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadedproducts = Provider.of<Topbanners>(context,listen: true);
    final products = loadedproducts.itemsss;
    return isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PageView.builder(
      onPageChanged: _onchanged,
      itemCount: products.length,
      controller: _pagecontroller,
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: makepage(products[i].imageUrl),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 8, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List<Widget>.generate(
                      products.length,
                      (int index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 10,
                          width: (index == _currentPage) ? 30 : 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: (index == _currentPage)
                                  ? Colors.grey
                                  : Theme.of(context).accentColor),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makepage(String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(20),
            right: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).accentColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
    );
  }
}
