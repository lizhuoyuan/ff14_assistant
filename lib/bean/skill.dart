/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 *
 */
class SkillsResponse {
  int code;
  List<Skill> data;

  SkillsResponse({this.code, this.data});

  SkillsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Skill>();
      json['data'].forEach((v) {
        data.add(Skill.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Skill {
  String name;
  String slv;
  String type;
  String firstTime;
  String repeatTime;
  String desc;

  Skill(
      {this.name,
      this.slv,
      this.type,
      this.firstTime,
      this.repeatTime,
      this.desc});

  Skill.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slv = json['slv'];
    type = json['type'];
    firstTime = json['first_time'];
    repeatTime = json['repeat_time'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slv'] = this.slv;
    data['type'] = this.type;
    data['first_time'] = this.firstTime;
    data['repeat_time'] = this.repeatTime;
    data['desc'] = this.desc;
    return data;
  }
}
