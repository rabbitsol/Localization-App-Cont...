import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:localizationapp/screens/signIn.dart';
import '../model/appcolor.dart';
import '../model/appicons.dart';
import '../widgets/appbarwidget.dart';
import '../widgets/nextbutton.dart';

class Localisation extends StatefulWidget {
  const Localisation({super.key});

  @override
  State<Localisation> createState() => _LocalisationState();
}

class _LocalisationState extends State<Localisation> {
//   final List<String> item1 = [
//     'Arabic'.tr,
//     'English'.tr,
//   ];
//   List<DropdownMenuItem<String>> _createList1() {
//     return item1
//         .map<DropdownMenuItem<String>>(
//           (e) => DropdownMenuItem(
//             value: e,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(e, style: Theme.of(context).textTheme.bodyMedium),
//             ),
//           ),
//         )
//         .toList();
//   }

//   String? selectedValue1;

  final List<String> item2 = [
    'Kuwait',
    'Pakistan',
  ];
  List<DropdownMenuItem<String>> _createList2() {
    return item2
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(e.tr, style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        )
        .toList();
  }

  String? selectedValue2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: appbars("titletext1".tr)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppIcons.logo,
              height: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColor.form,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('prefferedlanguage'.tr),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 16),
                            icon: const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Icon(
                                Icons.arrow_drop_down_circle,
                                color: AppColor.purple,
                              ),
                            ),
                            value: Get.locale!.languageCode,
                            items: const [
                              DropdownMenuItem(
                                value: 'en',
                                child: Text('English'),
                              ),
                              DropdownMenuItem(
                                value: 'ar',
                                child: Text('العربية'),
                              ),
                            ],
                            onChanged: (value) {
                              Get.updateLocale(Locale(value!));
                              GetStorage().write('locale', value);
                            },
                          ),
                        ),
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColor.form,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.arrow_drop_down_circle,
                              color: AppColor.purple,
                            ),
                          ),
                          hint: Text('country'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 16)),
                          items: _createList2(),
                          value: selectedValue2,
                          onChanged: (String? value) => setState(() {
                            selectedValue2 = value ?? "";
                          }),
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 50),
            NextButton(
                txt: 'nextbuttontext'.tr,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                }),
          ],
        ),
      ),
    );
  }
}
