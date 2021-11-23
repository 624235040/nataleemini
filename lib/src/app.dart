
import 'package:flutter/material.dart';
import 'package:nataleemini/src/configs/app_route.dart';
import 'package:nataleemini/src/configs/app_setting.dart';
import 'package:nataleemini/src/pages/home/home_page.dart';
import 'package:nataleemini/src/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              color: Colors.white,
            );
          } else {
            final token =
            snapshot.data.getString(AppSetting.userNameSetting ?? '');
            if (token != null) {
              return LoginPage();
            } else {
              //return LoginPage();
              return HomePage();
            }
          }
        },
      ),
    );
  }
} //end class
