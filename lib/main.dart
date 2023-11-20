import 'package:flutter/material.dart';
import 'package:nilufer_inovasyon/pages/login_page.dart';
import 'package:nilufer_inovasyon/pages/main_page.dart';
import 'package:nilufer_inovasyon/pages/splash_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Flutter uygulamasının genel tasarımını ve yapılandırmasını belirlemek için kullanılır

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          theme: ThemeData(useMaterial3: false),
          debugShowCheckedModeBanner: false,

          //Scaffold, bir Flutter uygulamasının temel yapı taşlarından biridir ve genellikle bir ekranın temel tasarımını ve düzenini belirlemek için kullanılır

          home: SplashPage());
    });
  }
}
