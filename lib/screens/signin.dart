import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:localizationapp/screens/socialsignup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../model/appicons.dart';
import '../widgets/appbarwidget.dart';
import '../widgets/nextbutton.dart';
import '../widgets/textfields.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  bool chkvalue1 = false;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        // User signed in
        print('User signed in: ${account.email}');
      } else {
        // User signed out
        print('User signed out');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 50),
            child: appbars("titletext2".tr)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Image.asset(
                    AppIcons.logo,
                    height: 150,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const TextFields(
                      type: TextInputType.phone,
                      hints: 'mobilenumber',
                      iconss: Icons.phone,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text('forgetpassword'.tr,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 50),
                      child: Row(
                        children: [
                          Transform.scale(
                              scale: 0.95,
                              child: Checkbox(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black54),
                                value: chkvalue1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    chkvalue1 = !chkvalue1;
                                  });
                                },
                              )),
                          Text('remembermetext'.tr,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    NextButton(
                        txt: 'nextbuttontext'.tr,
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SocialSignUp()));
                        }),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "donthave".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black54)),
                          TextSpan(
                              text: "signuptext".tr,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'message'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black26, fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              signInWithGoogle();
                              // if (mounted) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => const SocialSignUp(),
                              //     ),
                              //   );
                              // }
                            },
                            child: Image.asset(AppIcons.google,
                                width: 45, height: 45)),
                        GestureDetector(
                          onTap: () async {
                            final LoginResult result =
                                await FacebookAuth.instance.login();
                            if (result.status == LoginStatus.success) {
                              final accessToken = result.accessToken;
                              if (accessToken != null) {
                                final graphResponse = await http.get(Uri.parse(
                                    'https://graph.facebook.com/v10.0/me?fields=name,email&access_token=${accessToken.token}'));
                                final profile = json.decode(graphResponse.body);
                                final String name = profile['name'];
                                final String email = profile['email'];
                                // Do something with the user's name and email
                              }
                            } else if (result.status == LoginStatus.cancelled) {
                              // User cancelled login
                            } else {
                              // Login failed
                            }
                          },
                          child:
                              Image.asset(AppIcons.fb, width: 50, height: 50),
                        ),

                        //                     GestureDetector(
                        //                         onTap: () async {
                        //                           final LoginResult result = await FacebookAuth.instance.login();
                        // if (result.status == LoginStatus.success) {
                        //   final accessToken = result.accessToken;
                        //   final graphResponse = await http.get(Uri.parse(
                        //       'https://graph.facebook.com/v10.0/me?fields=name,email&access_token=${accessToken.token}'));
                        //   final profile = json.decode(graphResponse.body);
                        //   final String name = profile['name'];
                        //   final String email = profile['email'];
                        //   // Do something with the user's name and email
                        // } else if (result.status == LoginStatus.cancelled) {
                        //   // User cancelled login
                        // } else {
                        //   // Login failed
                        // }

                        //                         },
                        //                         child: Image.asset(AppIcons.fb,
                        //                             width: 50, height: 50)),
                        GestureDetector(
                            onTap: () {
                              // final appId = '147221607552912';
                              // final appSecret =
                              //     'cc40ea67fdc2125ad702b5c8abb8c851';

                              // final token =
                              //     await _getAccessToken(appId, appSecret);
                              // final userData = await _getUserData(token);

                              // // TODO: Save user data to state or shared preferences

                              // Get.back();
                            },
                            child: Image.asset(AppIcons.insta,
                                width: 52, height: 52)),
                        GestureDetector(
                            onTap: () {},
                            child: Image.asset(AppIcons.apple,
                                width: 42, height: 42)),
                      ],
                    )
                  ],
                )
              ]),
        ));
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Authentication succeeded
        print('User signed in: ${googleUser.email}');
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SocialSignUp()),
        );
      } else {
        // Authentication failed
        print('Sign in failed');
      }
    } catch (error) {
      // Handle the error
      print(error);
    }
  }
}
