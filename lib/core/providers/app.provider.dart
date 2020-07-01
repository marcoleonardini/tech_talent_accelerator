import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/core/models/globa_summaryl.model.dart';
import 'package:tech_talent_accelerator/core/services/covid.service.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class AppProvider extends ChangeNotifier {
  List<Country> _listCountries = [];
  GlobalSummary globalSummary;
  bool sortConfirmed = false;
  bool isSorted = false;

  var globalSeries = [
    charts.Series<GlobalStatistics, String>(
      id: 'Clicks',
      domainFn: (GlobalStatistics globalStatistics, _) => globalStatistics.type,
      measureFn: (GlobalStatistics globalStatistics, _) =>
          globalStatistics.numbers,
      colorFn: (GlobalStatistics globalStatistics, _) => globalStatistics.color,
      data: <GlobalStatistics>[],
    ),
  ];

  void loadSummary() async {
    final resp = await CovidService().getSummary();

    _listCountries = [];
    for (var item in resp['Countries']) {
      _listCountries.add(Country.fromJson(item));
    }

    globalSummary = GlobalSummary.fromJson(resp['Global']);

    globalSeries[0].data.addAll([
      GlobalStatistics(
          color: Colors.red,
          numbers: globalSummary.totalConfirmed,
          type: 'Confirmed'),
      GlobalStatistics(
          color: Colors.blue,
          numbers: globalSummary.totalDeaths,
          type: 'Deaths'),
      GlobalStatistics(
          color: Colors.green,
          numbers: globalSummary.totalRecovered,
          type: 'Recovered')
    ]);
    notifyListeners();
  }

  void sortContries() async {
    isSorted = true;
    _listCountries.sort((a, b) => a.totalConfirmed.compareTo(b.totalConfirmed));
    if (sortConfirmed) _listCountries = _listCountries.reversed.toList();
    sortConfirmed = !sortConfirmed;
    notifyListeners();
  }

  UnmodifiableListView<Country> get listCountries =>
      UnmodifiableListView(_listCountries);
}
