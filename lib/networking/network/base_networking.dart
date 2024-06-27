import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:promilo/networking/data/exception.dart';
import 'package:promilo/networking/network/base_apiservices.dart';

class NetworkServisesApi implements BaseApiServices {
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
        },
      ).timeout(const Duration(seconds: 50));

      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException("Time out try Again");
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(response.statusCode.toString());

      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
