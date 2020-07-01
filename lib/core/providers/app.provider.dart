import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/core/models/globa_summaryl.model.dart';
import 'package:tech_talent_accelerator/core/services/covid.service.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class AppProvider extends ChangeNotifier {
  List<Country> _listCountries = [];
  GlobalSummary globalSummary;
  GlobalSummary globalNewSummary;
  bool sortConfirmed = false;
  bool isSorted = false;

  var globalSerie = [
    charts.Series<GlobalStatistics, String>(
      id: 'Total Summary',
      domainFn: (GlobalStatistics globalStatistics, _) => globalStatistics.type,
      measureFn: (GlobalStatistics globalStatistics, _) =>
          globalStatistics.numbers,
      colorFn: (GlobalStatistics globalStatistics, _) => globalStatistics.color,
      data: <GlobalStatistics>[],
    ),
  ];
  var globalNewSerie = [
    charts.Series<GlobalStatistics, String>(
      id: 'New Summary',
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

    globalSerie[0].data.addAll([
      GlobalStatistics(
          color: Colors.orange.withOpacity(0.75),
          numbers: globalSummary.totalConfirmed,
          type: 'Total Confirmed'),
      GlobalStatistics(
          color: Colors.deepOrange.withOpacity(0.75),
          numbers: globalSummary.totalDeaths,
          type: 'Total Deaths'),
      GlobalStatistics(
          color: Colors.lightGreen.withOpacity(0.75),
          numbers: globalSummary.totalRecovered,
          type: 'Total Recovered')
    ]);

    globalNewSerie[0].data.addAll([
      GlobalStatistics(
          color: Colors.orange.withOpacity(0.75),
          numbers: globalSummary.newConfirmed,
          type: 'NewConfirmed'),
      GlobalStatistics(
          color: Colors.deepOrange.withOpacity(0.75),
          numbers: globalSummary.newDeaths,
          type: 'NewDeaths'),
      GlobalStatistics(
          color: Colors.lightGreen.withOpacity(0.75),
          numbers: globalSummary.newRecovered,
          type: 'NewRecovered')
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
