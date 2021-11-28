import 'package:concrete_mixdesign_for_study/pages/tabbar_main.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: TabbarMain(0),
      duration: 3000,
      imageSize: 200,
      //imageSrc: "assets/images/LogoApp.png",
      text: "Concrete mixdesign for study",
      backgroundColor: Colors.white,
    );
  }
}
