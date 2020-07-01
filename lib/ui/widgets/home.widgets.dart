import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';
import 'package:tech_talent_accelerator/ui/widgets/buttons.widgets.dart';

class CountriesContent extends StatelessWidget {
  const CountriesContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              // width: 128.0,
              child: Text(
                'Country',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Spacer(),
            SortButton(),
          ],
        ),
        Expanded(
          child: Consumer<AppProvider>(
            builder: (context, AppProvider appProvider, __) {
              if (appProvider.listCountries.isEmpty)
                return Center(child: CircularProgressIndicator());
              final _listContry = appProvider.listCountries;
              return ListView.builder(
                reverse: false,
                itemCount: _listContry.length,
                itemBuilder: (context, index) {
                  final country = _listContry[index];
                  return ListTile(
                    title: Text(country.country),
                    trailing: Text(
                      country.totalConfirmed.toString(),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
