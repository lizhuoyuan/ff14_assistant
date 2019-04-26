/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:ff14_assistant/bean/skill.dart';
import 'package:ff14_assistant/bloc/skills_bloc.dart';
import 'package:ff14_assistant/widget/skill_item_widget.dart';
import 'package:flutter/material.dart';

class SkillsPage extends StatefulWidget {
  final int id;
  final String title;

  SkillsPage({this.id, this.title});

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  SkillsBLoC _bLoC;

  @override
  void initState() {
    super.initState();
    _bLoC = SkillsBLoC();
    _bLoC.getSkills(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('专有技能'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        builder: _builder,
        stream: _bLoC.steam,
        initialData: [],
      ),
    );
  }

  Future getData() async {
    _bLoC.getSkills(widget.id);
  }

  Widget _builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('-------none');
        return Text('${ConnectionState.none}');
        break;
      case ConnectionState.done:
        print('-------done');
        return Text('${ConnectionState.done}');
        break;
      case ConnectionState.active:
        print('-------active');

        if (snapshot.hasError) {
          return Center(
            child: Text('has Error'),
          );
        }
        if (snapshot.hasData) {
          List<Skill> skills = snapshot.data;

          if (skills.length == 0) {
            return Center(
              child: Text('没数据啊'),
            );
          }

          return RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) => SkillItem(skills[index]),
              itemCount: skills.length,
            ),
            onRefresh: getData,
          );
        }
        break;

      case ConnectionState.waiting:
        print('-------waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
        break;
      default:
        print('-------default');
        return Text('default');
        break;
    }
    return Text('default');
  }
}
