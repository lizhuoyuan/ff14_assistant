/*
 * author: Created by 李卓原 on 2019/6/5.
 * email: zhuoyuan93@gmail.com
 *
 */

import 'package:firebase_admob/firebase_admob.dart';

class Utils {
  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    childDirected: false,
    testDevices: <String>[], // Android emulators are considered test devices
  );
}
