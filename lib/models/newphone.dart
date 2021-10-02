import 'package:flutter/foundation.dart';

class NewPhone with ChangeNotifier {
  final String id;
  final String idproduct;
  final String imageUrl;
  final String logo;
  final String nameofCampany;
  final String color;
  

  NewPhone(
      {@required this.id,
      @required this.idproduct,
      @required this.imageUrl,
      @required this.logo,
      @required this.nameofCampany,
      @required this.color});
}
