import 'package:flutter/material.dart';
import 'package:mobility/widget/RowofComparr.dart';
import '../widget/topofcomparescreen.dart';
import '../widget/dialog_search.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class CompareScreen extends StatefulWidget {
  static const routeName = "/Compare_screen";

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
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
    final weig = MediaQuery.of(context).size.width;
    final high = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              SafeArea(
                child: Text(
                  "Compare",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "RobotoCondensed",
                      fontSize: 20),
                ),
              ),
              Divider(
                indent: 100,
                color: Theme.of(context).accentColor,
                endIndent: 100,
              ),
              TopBarCompareScreen(),
              SizedBox(
                height: 5,
              ),
              Divider(
                indent: 100,
                color: Theme.of(context).accentColor,
                endIndent: 100,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].screen,
                  secondText: (num2 == null) ? '' : phoness[num2].screen,
                  icon: 'assets/images/screen.svg',
                  name: 'Screen',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].cpu,
                  secondText: (num2 == null) ? '' : phoness[num2].cpu,
                  icon: 'assets/images/cpu.svg',
                  name: 'Cpu',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].ram,
                  secondText: (num2 == null) ? '' : phoness[num2].ram,
                  icon: 'assets/images/Ram.svg',
                  name: 'Ram',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].gpu,
                  secondText: (num2 == null) ? '' : phoness[num2].gpu,
                  icon: 'assets/images/gpu.svg',
                  name: 'Gpu',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].frontcamera,
                  secondText: (num2 == null) ? '' : phoness[num2].frontcamera,
                  icon: 'assets/images/frontcamera.svg',
                  name: 'Front Camera',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].rearcamera,
                  secondText: (num2 == null) ? '' : phoness[num2].rearcamera,
                  icon: 'assets/images/backcamera.svg',
                  name: 'Back Camera',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].space,
                  secondText: (num2 == null) ? '' : phoness[num2].space,
                  icon: 'assets/images/memory.svg',
                  name: 'Memory',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].capstiybattery,
                  secondText:
                      (num2 == null) ? '' : phoness[num2].capstiybattery,
                  icon: 'assets/images/battery.svg',
                  name: 'Battery',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].os,
                  secondText: (num2 == null) ? '' : phoness[num2].os,
                  icon: 'assets/images/system.svg',
                  name: 'System',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].speedofcharge,
                  secondText: (num2 == null) ? '' : phoness[num2].speedofcharge,
                  icon: 'assets/images/more.svg',
                  name: 'More',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].screen,
                  secondText: (num2 == null) ? '' : phoness[num2].screen,
                  icon: 'assets/images/gaming.svg',
                  name: 'Gaming',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
              Container(
                width: double.infinity,
                height: high * .15,
                child: RowofCompare(
                  firsttext: (num1 == null) ? '' : phoness[num1].price,
                  secondText: (num2 == null) ? '' : phoness[num2].price,
                  icon: 'assets/images/price.svg',
                  name: 'Price',
                ),
              ),
              Divider(
                color: Theme.of(context).accentColor,
                indent: weig * .20,
                endIndent: weig * .20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
