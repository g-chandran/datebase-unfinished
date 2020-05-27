import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

class NetworkHelper {
  Dio dio = Dio();
  Future<dynamic> getResponse({String date, String month}) async {
    try {
      print('$date, $month');
      var result = await dio.get(
          'https://en.wikipedia.org/api/rest_v1/feed/onthisday/all/$month/$date',
          options: buildCacheOptions(Duration(days: 7), forceRefresh: true),
          onReceiveProgress: (count, total) => print('$count, $total'));
      var resultText = result.data;
      print(resultText);
    } catch (e) {
      print(e);
    }
  }
}
