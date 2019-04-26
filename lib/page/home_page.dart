/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 * 首页 app一进来的页面 有跳转到career page的入口
 */

import 'package:ff14_assistant/common/constant.dart';
import 'package:ff14_assistant/page/career_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
          return CareerPage();
        }));
      },
      child: Center(
        child: Text(careers[index]['name']),
      ),
    );
  }
}
