import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "https://fakestoreapi.com/";

Future<ResponseBody> get(String url) async {
  try {
    http.Response response = await http.get(Uri.parse("$baseUrl$url"));
    if (response.statusCode == 200) {
      ResponseBody responseBody = ResponseBody(
        result: jsonDecode(response.body),
        statusCode: response.statusCode,
      );
      return responseBody;
    } else {
      return ResponseBody(
        isError: true,
        result: jsonDecode(response.body),
        statusCode: response.statusCode,
      );
    }
  } catch (e) {
    return ResponseBody(isError: true, error: e.toString());
  }
}

class ResponseBody {
  final dynamic result;
  final int? statusCode;
  final bool isError;
  final String error;

  ResponseBody({this.result, this.statusCode, this.isError = false, this.error = ""});
}


// statusCode:
// 200
// body