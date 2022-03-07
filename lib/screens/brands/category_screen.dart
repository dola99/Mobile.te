import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobility/screens/brands/componets/grid_category.dart';
import 'package:mobility/widget/background_continer.dart';

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
      debugPrint('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: const AdRequest(),
      adUnitId: BannerAd.testAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => debugPrint('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => debugPrint('$BannerAd onAdClosed.'),
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
        begin: const Alignment(2.123234262925839e-17, 2),
        end: const Alignment(-5.4, 2.123234262925839e-12),
        colors: const [
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
