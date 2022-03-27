import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mobility/screens/brands/category_screen.dart';
import 'package:mobility/screens/gamer/gamer_models_screen.dart';
import 'package:mobility/screens/home/widgets/ball_of_flat_button.dart';
import 'package:mobility/screens/home/widgets/container_backgroud_flat_button.dart';
import 'package:mobility/screens/home/widgets/image_of_flat_button.dart';
import 'package:mobility/screens/home/widgets/text_of_container.dart';
import 'package:mobility/screens/home/widgets/white_of_shape.dart';
import 'package:mobility/screens/tablets/tablets_screen.dart';
import 'package:mobility/screens/watches/watches_screen.dart';

class FlatButtons extends StatefulWidget {
  @override
  _FlatButtonsState createState() => _FlatButtonsState();
}

class _FlatButtonsState extends State<FlatButtons> {
  /* late InterstitialAd? _interstitialAd;
  late RewardedAd? _rewardedAd;

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: RewardedAd.testAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    });
    _rewardedAd = null;
  }
*/
  /*@override
  void initState() {
    _createInterstitialAd();
    _createRewardedAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd!.dispose();
    _rewardedAd!.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wights = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        //red dialog
        Positioned(
          top: ScreenUtil().setHeight(1),
          left: ScreenUtil().setWidth(2),
          child: GestureDetector(
            onTap: () {
              //    _showRewardedAd();
              Navigator.of(context).pushNamed(GamerScreen.routename);
            },
            child: BackgroudnFlatButtonContainer(
              linearGradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(247, 12, 12, 1),
                  const Color.fromRGBO(247, 12, 12, 1).withOpacity(.9),
                  const Color.fromRGBO(247, 12, 12, 1).withOpacity(.8),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
        //amber dialogs
        Positioned(
          top: ScreenUtil().setHeight(2),
          right: ScreenUtil().setWidth(2),
          child: GestureDetector(
            onTap: () {
              //     _showInterstitialAd();
              Navigator.of(context).pushNamed(TabletsScreen.routeName);
            },
            child: BackgroudnFlatButtonContainer(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
              ),
              linearGradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(255, 189, 89, 1).withOpacity(.8),
                  const Color.fromRGBO(255, 189, 89, 1).withOpacity(.9),
                  const Color.fromRGBO(255, 189, 89, 1),
                ],
              ),
            ),
          ),
        ),
        //yellow dialog
        Positioned(
          bottom: ScreenUtil().setHeight(2),
          right: ScreenUtil().setWidth(2),
          child: GestureDetector(
            onTap: () {
              //   _showInterstitialAd();
              Navigator.of(context).pushNamed(WatchesScreen.routeName);
            },
            child: BackgroudnFlatButtonContainer(
              linearGradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(252, 213, 5, 1).withOpacity(.8),
                  const Color.fromRGBO(252, 213, 5, 1).withOpacity(.9),
                  const Color.fromRGBO(252, 213, 5, 1),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        //blue dialoh

        Positioned(
          bottom: ScreenUtil().setHeight(2),
          left: ScreenUtil().setWidth(2),
          child: GestureDetector(
            onTap: () {
              //  _showInterstitialAd();
              Navigator.pushNamed(context, CategoryScreen.routeName);
            },
            child: BackgroudnFlatButtonContainer(
              linearGradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(17, 58, 71, 1),
                  const Color.fromRGBO(17, 58, 71, 1).withOpacity(.9),
                  const Color.fromRGBO(17, 58, 71, 1).withOpacity(.8),
                  const Color.fromRGBO(17, 58, 71, 1).withOpacity(.7),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
              offset: const Offset(-1, 2),
            ),
          ),
        ),
        //white of blue dialog
        Positioned(
          bottom: MediaQuery.of(context).size.width * .023,
          left: MediaQuery.of(context).size.width * .253,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.pushNamed(context, CategoryScreen.routeName);
            },
            child: const WhiteOfShape(
              borderRadiusGeometry: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
        //white of yellow dialog
        Positioned(
          bottom: MediaQuery.of(context).size.width * .023,
          right: MediaQuery.of(context).size.width * .253,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.of(context).pushNamed(WatchesScreen.routeName);
            },
            child: const WhiteOfShape(
              borderRadiusGeometry: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        //blue top of white
        Positioned(
          bottom: MediaQuery.of(context).size.width * .031,
          left: MediaQuery.of(context).size.width * .260,
          child: GestureDetector(
            onTap: () {
              //  _showInterstitialAd();
              Navigator.pushReplacementNamed(context, CategoryScreen.routeName);
            },
            child: Container(
              width: wights * .200,
              height: height * .077,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
                color: Color.fromRGBO(17, 58, 71, 1),
              ),
            ),
          ),
        ),
        //yellow of the white of yellow dialog
        Positioned(
          bottom: MediaQuery.of(context).size.width * .031,
          right: MediaQuery.of(context).size.width * .260,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.of(context).pushNamed(WatchesScreen.routeName);
            },
            child: Container(
              width: wights * .200,
              height: height * .077,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
                color: Color.fromRGBO(252, 213, 5, 1),
              ),
            ),
          ),
        ),
        //white of amber dialog
        Positioned(
          top: MediaQuery.of(context).size.width * .023,
          right: MediaQuery.of(context).size.width * .253,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.of(context).pushNamed(TabletsScreen.routeName);
            },
            child: const WhiteOfShape(
              borderRadiusGeometry: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
        //top of amber white
        Positioned(
          top: MediaQuery.of(context).size.width * .031,
          right: MediaQuery.of(context).size.width * .260,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.of(context).pushNamed(TabletsScreen.routeName);
            },
            child: Container(
              width: wights * .200,
              height: height * .077,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                color: Color.fromRGBO(255, 189, 89, 1),
              ),
            ),
          ),
        ),
        //white of red dialog
        Positioned(
          top: MediaQuery.of(context).size.width * .023,
          left: MediaQuery.of(context).size.width * .253,
          child: GestureDetector(
            onTap: () {
              //    _showRewardedAd();
              Navigator.of(context).pushNamed(GamerScreen.routename);
            },
            child: const WhiteOfShape(
              borderRadiusGeometry: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .012,
          left: MediaQuery.of(context).size.width * .030,
          child: BallOfMatrerial(),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .055,
          left: MediaQuery.of(context).size.width * .030,
          child: BallOfMatrerial(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .035,
          left: MediaQuery.of(context).size.width * .060,
          child: GestureDetector(
            onTap: () {
              //      _showRewardedAd();
              Navigator.of(context).pushNamed(GamerScreen.routename);
            },
            child: const TextFlatButton(
              'Gamer',
              Colors.black,
              size: 22,
            ),
          ),
        ),
        //red of top white of red dialog
        Positioned(
          top: MediaQuery.of(context).size.width * .031,
          left: MediaQuery.of(context).size.width * .260,
          child: GestureDetector(
            onTap: () {
              //  _showRewardedAd();

              Navigator.of(context).pushNamed(GamerScreen.routename);
            },
            child: Container(
              width: wights * .200,
              height: height * .077,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  )
                ],
                color: Color.fromRGBO(255, 13, 13, 1),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height * .025,
          left: MediaQuery.of(context).size.width * .070,
          child: GestureDetector(
            onTap: () {
              //   _showInterstitialAd();
              Navigator.of(context).pushNamed(CategoryScreen.routeName);
            },
            child: const TextFlatButton('Brands', Colors.white),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .025,
          right: MediaQuery.of(context).size.width * .050,
          child: GestureDetector(
            onTap: () {
              //  _showInterstitialAd();
              Navigator.of(context).pushNamed(WatchesScreen.routeName);
            },
            child: const TextFlatButton('Watches', Colors.black),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .040,
          right: MediaQuery.of(context).size.width * .080,
          child: GestureDetector(
            onTap: () {
              //    _showInterstitialAd();
              Navigator.of(context).pushNamed(TabletsScreen.routeName);
            },
            child: const TextFlatButton('Tablets', Colors.white),
          ),
        ),

        Positioned(
          top: MediaQuery.of(context).size.height * .042,
          left: MediaQuery.of(context).size.width * .34,
          child: BallOfMatrerial(),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .040,
          left: MediaQuery.of(context).size.width * .34,
          child: BallOfMatrerial(),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .04,
          right: MediaQuery.of(context).size.width * .34,
          child: BallOfMatrerial(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .04,
          right: MediaQuery.of(context).size.width * .33,
          child: BallOfMatrerial(),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .055,
          right: MediaQuery.of(context).size.width * .030,
          child: BallOfMatrerial(),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .020,
          right: MediaQuery.of(context).size.width * .030,
          child: BallOfMatrerial(),
        ),

        Positioned(
          bottom: MediaQuery.of(context).size.height * .02,
          right: MediaQuery.of(context).size.width * .360,
          child: GestureDetector(
            onTap: () {
              // _showInterstitialAd();
              Navigator.of(context).pushNamed(WatchesScreen.routeName);
            },
            child: const ImageOfFlatButton(
              image: 'assets/images/watch.png',
              width: .070,
              height: .070,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .010,
          left: MediaQuery.of(context).size.width * .320,
          child: GestureDetector(
            onTap: () {
              //     _showRewardedAd();
              Navigator.of(context).pushNamed(GamerScreen.routename);
            },
            child: const ImageOfFlatButton(
              image: 'assets/images/gamer.png',
              width: .1770,
              height: .130,
              boxFit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .025,
          right: MediaQuery.of(context).size.width * .345,
          child: GestureDetector(
            onTap: () {
              //     _showInterstitialAd();
              Navigator.pushNamed(context, TabletsScreen.routeName);
            },
            child: const ImageOfFlatButton(
              image: 'assets/images/tablet.png',
              width: .1,
              height: 0.060,
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .023,
          left: MediaQuery.of(context).size.width * .370,
          child: const ImageOfFlatButton(
            image: 'assets/images/mobil.png',
            width: .060,
            height: 0.0680,
          ),
        ),
      ],
    );
  }
}
