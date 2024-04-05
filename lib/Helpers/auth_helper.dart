import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:Doctor/services/api_constants.dart';

class AuthHelper {
  static const baseUrl = ApiConstants.baseUrl;

  static Future<http.Response> post(String endpoint, dynamic body) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {'Content-Type': 'application/json'};
    final response = await http.get(url, headers: headers);
    return response;
  }
}
