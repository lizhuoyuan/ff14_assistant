/*
 * author: Created by 李卓原 on 2019/3/21.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:ff14_assistant/bloc/skills_bloc.dart';
import 'package:flutter/material.dart';

class BLoCProvider extends InheritedWidget {
  BLoCProvider({Key key, Widget child}) : super(key: key, child: child);

  final SkillsBLoC skillsBLoC = SkillsBLoC();

  static SkillsBLoC ofSkills(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BLoCProvider) as BLoCProvider)
          .skillsBLoC;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
