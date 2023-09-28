import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Src/Appscreens/Dashboard/Homepage.dart';
import 'package:my_app/Src/Appscreens/LoginScreen/Loginpage/login.dart';

//GlobalKey for navigation
GlobalKey<NavigatorState> navkey = Get.key;

//
final GlobalKey parentKey = GlobalKey();
void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          color: Colors.amber,
          //toolbarHeight: 40,
        ),
      ),
      initialRoute: '/',
      // routes: {
      //   "/": (context) => FirstRoute(),
      //   '/SecondRoute': (context) => SecondRoute()
      // },
      getPages: [
        GetPage(name: "/", page: () => const ApploginPage()),
        GetPage(name: "/Home", page: () => const DashBoard()),
        //GetPage(name: "/ReviewOrder", page: () =>const ReviewOrder())
      ],
    );
  }
}
