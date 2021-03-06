// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Model.dart';

class NetworkRequest {
  static const String url =
      'https://61cc6929198df60017aec067.mockapi.io/pointdb';

  static List<pointdb> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<pointdb> products =
        list.map((model) => pointdb.fromJson(model)).toList();
    return products;
  }

  static Future<List<pointdb>> fetchProducts({int page = 1}) async {
    final response = await http.get('$url');
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Error');
    }
  }
}
