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
  var _isInit = true;
  var isLoading = false;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        isLoading = true;
      });
      Provider.of<Categorys>(context).fetchandsetProducts().then((_) {
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
            : SafeArea(child: GridCategory()),
      ),
    );
  }
}
