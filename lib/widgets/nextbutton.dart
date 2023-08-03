import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/appcolor.dart';
import '../screens/signin.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.txt, required this.press});
  final String txt;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 15,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColor.purple,
            fixedSize: Size(MediaQuery.of(context).size.width, 60)),
        onPressed: press,
        child: Text(
          txt.tr,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
