import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localizationapp/screens/dashboard.dart';
import 'package:localizationapp/widgets/textfields.dart';

import '../model/appcolor.dart';
import '../model/appicons.dart';
import '../widgets/appbarwidget.dart';
import '../widgets/nextbutton.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: appbars("titletext3".tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(70.0, 70, 70, 30),
                  child: Image.asset(
                    AppIcons.logo,
                    height: 150,
                  ),
                ),
                Image.asset(
                  AppIcons.googleimage,
                  height: 120,
                ),
                Column(
                  children: [
                    const TextFields(
                        type: TextInputType.phone,
                        hints: 'phonenumber',
                        iconss: Icons.phone),
                    const SizedBox(height: 10),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          style: const TextStyle(
                              fontSize: 18,
                              color: AppColor.purple,
                              fontWeight: FontWeight.w600),
                          cursorColor: Colors.black,
                          cursorHeight: 20,
                          onChanged: (val) {},
                          textAlign: TextAlign.start,
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.form,
                            contentPadding: const EdgeInsets.only(top: 10),
                            prefixIcon: Image.asset(
                              AppIcons.whatsapp,
                              height: 15,
                              width: 15,
                            ),
                            hintText: 'whatsappnumber'.tr,
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColor.purple,
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: NextButton(
                          txt: 'confirmsignup',
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()));
                          }),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
