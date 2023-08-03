import 'package:flutter/material.dart';
import 'package:localizationapp/model/appcolor.dart';
import 'package:localizationapp/screens/localisation.dart';
import 'package:get/get.dart';
import 'package:localizationapp/widgets/language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.purple)),
          primarySwatch: Colors.purple,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              color: AppColor.purple,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20))),
      home: const Localisation(),
    );
  }
}
