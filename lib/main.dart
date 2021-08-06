import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modulos/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modulos/home/home_page.dart';

import 'package:payflow/modulos/login/login_page.dart';
import 'package:payflow/modulos/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';
//import 'package:payflow/modulos/splash/splash_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

import 'modulos/insert_boleto/insert_boleto_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null,
            ),
      },
      //SplashPage(),
    );
  }
}
