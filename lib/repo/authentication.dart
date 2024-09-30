import 'dart:convert';
import 'dart:developer';

import 'package:api_task/utils/api_urls.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

String token = "";

class AuthenticationRepo {
  static var client = http.Client();
  static Future<Response?> userLogin(String username, String password) async {
    try {
      var user = {
        "username": username,
        "password": password,
        "expiresInMins": 30
      };
      var response = await client.post(Uri.parse(loginUrl),
          body: jsonEncode(user),
          headers: {"Content-Type": 'application/json'});
      debugPrint(response.statusCode.toString());
      if (kDebugMode) {
        print(user);
      }
      debugPrint(response.body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        token = responseBody["accessToken"];
        return response;
      } else {
        return response;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
  static Future fetchProducts() async {
    try {
    
      var response = await client.get(Uri.parse(fetchUrl));
      if (kDebugMode) {
       
      }
      
      return response;
    } catch (e) {
      log(e.toString());
      
    }
  }
}
