import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/core/services/covid.service.dart';

class AppProvider extends ChangeNotifier {
  List<Country> _listCountries = [];
  bool sortConfirmed = false;

  void loadCountries() async {
    _listCountries = await CovidService().getCountries();
    notifyListeners();
  }

  void sortContries() async {
    _listCountries.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
    if (sortConfirmed) _listCountries = _listCountries.reversed.toList();
    sortConfirmed = !sortConfirmed;
    notifyListeners();
  }

  UnmodifiableListView<Country> get listCountries =>
      UnmodifiableListView(_listCountries);
}
