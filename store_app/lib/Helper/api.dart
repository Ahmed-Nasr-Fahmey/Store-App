import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 400) {
      return jsonDecode(response.body);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(
          'There is Problem (In Client Side) with Status Code. => ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception(
          'There is Problem (In Server Side) with Status Code. => ${response.statusCode}');
    } else {
      throw Exception(
          'There is Problem with Status Code. => ${response.statusCode}');
    }
  }

  static Future<dynamic> post(
      {required String url, @required dynamic body}) async {
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        'Content-Type': 'multipart/form-data',
        'Accept': '*/*',
      },
    );

    if (response.statusCode >= 200 && response.statusCode < 400) {
      return jsonDecode(response.body);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(
          'There is Problem (In Client Side) with Status Code. => ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception(
          'There is Problem (In Server Side) with Status Code. => ${response.statusCode}');
    } else {
      throw Exception(
          'There is Problem with Status Code. => ${response.statusCode}');
    }
  }

  static Future<dynamic> put(
      {required String url, @required dynamic body}) async {
    print('url is : $url');
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': '*/*',
      },
    );
    print('response.body is : ${response.body}');
    if (response.statusCode >= 200 && response.statusCode < 400) {
      print('jsonDecode(response.body) is : ${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      throw Exception(
          'There is Problem (In Client Side) with Status Code. => ${response.statusCode}');
    } else if (response.statusCode >= 500) {
      throw Exception(
          'There is Problem (In Server Side) with Status Code. => ${response.statusCode}');
    } else {
      throw Exception(
          'There is Problem with Status Code. => ${response.statusCode}');
    }
  }
}
