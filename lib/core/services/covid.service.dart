import 'dart:convert';

import 'package:http/http.dart';

class CovidService {
  Future getSummary() async {
    var result = await get('https://api.covid19api.com/summary');

    var jsonDecoded = jsonDecode(result.body);
    return jsonDecoded;
  }
}
