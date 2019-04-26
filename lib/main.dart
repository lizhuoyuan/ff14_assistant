import 'package:ff14_assistant/app_routes.dart';
import 'package:ff14_assistant/bloc/bloc_provider.dart';
import 'package:ff14_assistant/page/career_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BLoCProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CareerPage(),
      routes: AppRoutes.routes,
    );
  }
}
