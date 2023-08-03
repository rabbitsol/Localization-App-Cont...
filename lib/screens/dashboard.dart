import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localizationapp/widgets/appbarwidget.dart';

import '../model/appcolor.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: appbars("titletext4".tr)),
    );
  }
}
