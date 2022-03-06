import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:mobility/widget/background_Continer.dart';
import 'componets/Grid_category.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = "/Category_screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _loadingAnchoredBanner = false;
  BannerAd? _anchoredBanner;
  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: AdRequest(),
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    banner.dispose();
    return banner.load();
  }

  @override
  void dispose() {
    _anchoredBanner!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loadingAnchoredBanner) {
      _loadingAnchoredBanner = true;
      _createAnchoredBanner(context);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BackgroundColor(
        begin: Alignment(2.123234262925839e-17, 2),
        end: Alignment(-5.4, 2.123234262925839e-12),
        colors: [
          Color.fromRGBO(17, 85, 71, 1),
          Color.fromRGBO(0, 0, 0, 1),
          Color.fromRGBO(17, 85, 71, 1),
          Color.fromRGBO(0, 0, 0, 1),
        ],
        widget: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: GridCategory(),
              ),
              if (_anchoredBanner != null)
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.green,
                    width: _anchoredBanner!.size.width.toDouble(),
                    height: _anchoredBanner!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredBanner!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
