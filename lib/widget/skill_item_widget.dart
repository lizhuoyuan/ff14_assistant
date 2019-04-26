/*
 * author: Created by 李卓原 on 2019/3/21.
 * email: zhuoyuan93@gmail.com
 * 技能的item组件
 */
import 'package:ff14_assistant/bean/skill.dart';
import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  final Skill item;

  SkillItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.green, width: 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 100,
            child: Text(item.name),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('学习条件:${item.slv}'),
                Text('CD:${item.repeatTime}'),
                Text('类型:${item.type}'),
                Text('释放时间:${item.firstTime}'),
              ],
            ),
          ),
          Expanded(child: Container(child: Text('${item.desc}')))
        ],
      ),
    );
  }
}
