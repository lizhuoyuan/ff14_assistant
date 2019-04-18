/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 * 职业
 */

import 'package:ff14_assistant/common/constant.dart';
import 'package:ff14_assistant/skills_page.dart';
import 'package:flutter/material.dart';

class CareerPage extends StatefulWidget {
  @override
  _CareerPageState createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('职业指南'),
        centerTitle: true,
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0, //主轴(竖直)方向间距
              crossAxisSpacing: 10.0, //纵轴(水平)方向间距
              childAspectRatio: 1.0), //纵轴缩放比例
          itemBuilder: _gridBuilder,
          itemCount: careers.length,
        ),
      ),
    );
  }

  Widget _gridBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return SkillsPage(id: index, title: careers[index]['name']);
        }));
      },
      child: Center(
        child: Text(careers[index]['name']),
      ),
    );
  }
}
