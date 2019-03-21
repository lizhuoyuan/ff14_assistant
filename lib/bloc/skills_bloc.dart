/*
 * author: Created by 李卓原 on 2019/3/21.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:ff14_assistant/bean/skill.dart';
import 'package:ff14_assistant/common/constant.dart';
import 'package:ff14_assistant/utils/http_util.dart';
import 'package:rxdart/rxdart.dart';

class SkillsBLoC {
  var _subject = BehaviorSubject<List<Skill>>();

  Observable<List<Skill>> get steam => _subject.stream;

  List<Skill> skills;

  Future getSkills(id) async {
    var response =
        await HttpUtil.getInstance().get('skill/${careers[id]['e_name']}');

    var skillsResponse = SkillsResponse.fromJson(response);
    if (skillsResponse.code == 0) {
      skills = skillsResponse.data;
      _subject.add(skills);
    }
  }

  void dispose() {
    _subject.close();
  }
}
