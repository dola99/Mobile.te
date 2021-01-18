import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categorys.dart';
import '../widget/Grid_category.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = "/Category_screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
    BannerAd _bannerAd;
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom, anchorOffset: .5);
  }

  @override
  void initState() {
    _bannerAd = BannerAd(adUnitId:'ca-app-pub-4854420444519405/2303654585', size: AdSize.banner);
    _loadBannerAd();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  var _isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Categorys>(context,listen: false).fetchandsetProducts().then((_) {
        setState(() {
          isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(2.123234262925839e-17, 2),
              end: Alignment(-5.4, 2.123234262925839e-12),
              colors: [
                Color.fromRGBO(17, 85, 71, 1),
                Color.fromRGBO(0, 0, 0, 1),
                Color.fromRGBO(17, 85, 71, 1),
                Color.fromRGBO(0, 0, 0, 1),
              ]),
        ),
        width: double.infinity,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(child: Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*.04),
              child: GridCategory(),
            )),
      ),
    );
  }
}
