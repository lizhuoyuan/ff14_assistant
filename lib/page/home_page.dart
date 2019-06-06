/*
 * author: Created by 李卓原 on 2019/3/20.
 * email: zhuoyuan93@gmail.com
 * 首页 app一进来的页面 有跳转到career page的入口
 */

import 'dart:async';

import 'package:ff14_assistant/common/constant.dart';
import 'package:ff14_assistant/utils/utils.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd _interstitialAd;
  Timer _timer;
  int delayTime = 5;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: adInterstitialId,
      targetingInfo: Utils.targetingInfo,
      listener: (MobileAdEvent event) {
        print("--------------InterstitialAd event $event");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadInterstitialAd();
    _timer = Timer.periodic(Duration(seconds: 1), (_timer) {
      if (delayTime == 0) {
        cancelTimerAndAd();
        return;
      }
      setState(() {
        delayTime--;
      });
      print(delayTime);
    });
  }

  void cancelTimerAndAd() {
    _timer?.cancel();
    _timer = null;
    _interstitialAd?.dispose();
    Navigator.pushReplacementNamed(context, 'career');
  }

  loadInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
