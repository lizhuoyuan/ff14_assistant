import 'package:ff14_assistant/app_routes.dart';
import 'package:ff14_assistant/bloc/bloc_provider.dart';
import 'package:ff14_assistant/common/constant.dart';
import 'package:ff14_assistant/page/home_page.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

void main() => runApp(BLoCProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: adAppId);
    return MaterialApp(
      title: 'FF14助手',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: AppRoutes.routes,
    );
  }
}
