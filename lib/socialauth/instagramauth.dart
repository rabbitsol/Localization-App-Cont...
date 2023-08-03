import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InstagramAuth extends StatefulWidget {
  const InstagramAuth({super.key});

  @override
  State<InstagramAuth> createState() => _InstagramAuthState();
}

class _InstagramAuthState extends State<InstagramAuth> {
  late String accessToken;

  Future<String> _getAccessToken(String appId, String appSecret) async {
    final authorizationUrl =
        'https://api.instagram.com/oauth/authorize?client_id=$appId&redirect_uri=http://localhost/&response_type=token';
    final result = await FlutterWebAuth.authenticate(
        url: authorizationUrl, callbackUrlScheme: 'http');

    final tokenParamIndex = result.indexOf('#access_token=');
    if (tokenParamIndex == -1) {
      throw Exception('Failed to retrieve access token');
    }

    final token = result.substring(tokenParamIndex + 14, result.length);
    setState(() {
      accessToken = token;
    });
    return token;
  }

  Future<Map<String, dynamic>> _getUserData(String accessToken) async {
    final url =
        'https://graph.instagram.com/me?fields=id,username&access_token=$accessToken';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to retrieve user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instagram Login')),
      body: Center(
        child: ElevatedButton(
          child: Text('Login with Instagram'),
          onPressed: () async {
            final appId = '147221607552912';
            final appSecret = 'cc40ea67fdc2125ad702b5c8abb8c851';

            final token = await _getAccessToken(appId, appSecret);
            final userData = await _getUserData(token);

            // TODO: Save user data to state or shared preferences

            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
