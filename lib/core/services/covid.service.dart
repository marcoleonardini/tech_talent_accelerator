import 'dart:convert';

import 'package:http/http.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';

class CovidService {
  Future<List<Country>> getCountries() async {
    var result = await get('https://api.covid19api.com/summary');

    var jsonDecoded = jsonDecode(result.body);

    List<Country> _listCountry = [];
    for (var item in jsonDecoded['Countries']) {
      _listCountry.add(Country.fromJson(item));
    }

    return _listCountry;
  }
}
