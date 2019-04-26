/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:ff14_assistant/page/career_page.dart';
import 'package:ff14_assistant/page/home_page.dart';
import 'package:ff14_assistant/page/skills_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    'home': (_) => HomePage(),
    'career': (_) => CareerPage(),
    'skills': (_) => SkillsPage(),
  };
}
