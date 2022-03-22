import 'package:flutter_dotenv/flutter_dotenv.dart';

// ignore: avoid_classes_with_only_static_members
class ServicesURLs {

   static String developmentEnvironment = dotenv.env['DEVELOPMENT_ENVIRONMENT'].toString();


  static String developmentEnvironmentWithoutHttp =
      dotenv.env['DEVELOPMENT_ENVIRONMENT_WITHOUT_HTTP'].toString();


  static String developmentEnvironmentScheme =
      dotenv.env['DEVELOPMENT_ENVIRONMENT_WITHOUT_HTTP_SCHEME'].toString();

}
