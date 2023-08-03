import 'package:flutter/material.dart';

import '../model/appcolor.dart';

Widget appbars(String apptitle) {
  return AppBar(
    toolbarHeight: 65,
    automaticallyImplyLeading: true,
    elevation: 0,
    backgroundColor: AppColor.purple,
    title: Text(apptitle),
  );
}
