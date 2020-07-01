import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';

class CountriesContent extends StatelessWidget {
  const CountriesContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, AppProvider appProvider, __) {
        if (appProvider.listCountries.isEmpty)
          return CircularProgressIndicator();
        final _listContry = appProvider.listCountries;
        return ListView.builder(
          reverse: false,
          itemCount: _listContry.length,
          itemBuilder: (context, index) {
            final country = _listContry[index];
            return ListTile(
              title: Text(country.country),
              trailing: Text(country.totalConfirmed.toString()),
            );
          },
        );
      },
    );
  }
}
