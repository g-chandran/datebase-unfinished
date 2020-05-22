import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class NetworkHelper {
  Dio dio = new Dio();
  Future<dynamic> getResponse({String date, String month}) async {
    try {
      var result = await dio.get(
          'https://en.wikipedia.org/api/rest_v1/feed/onthisday/all/$month/$date',
          options: buildCacheOptions(Duration(days: 7), forceRefresh: true));
      var resultText = result.data.toString();
      // var rs = TextEditingValue.fromJSON(result.data);
      // var resltC = jsonDecode(resultText);
      print(resultText);
    } catch (e) {
      print(e);
    }
  }
}
