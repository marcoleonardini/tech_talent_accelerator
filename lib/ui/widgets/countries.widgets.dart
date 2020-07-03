import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';
import 'package:tech_talent_accelerator/ui/widgets/buttons.widgets.dart';
import 'package:tech_talent_accelerator/ui/widgets/country.bottomsheet.widget.dart';
import 'package:tech_talent_accelerator/ui/widgets/label_indicator.widget.dart';

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
              child: Text(
                'Country',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SortButton(),
          ],
        ),
        Expanded(
          child: Consumer<AppProvider>(
            builder: (context, AppProvider appProvider, __) {
              if (appProvider.listCountries.isEmpty)
                return Center(child: CircularProgressIndicator());
              final _listContry = appProvider.listCountries;
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                reverse: false,
                itemCount: _listContry.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final country = _listContry[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(4.0),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          enableDrag: true,
                          // isScrollControlled: true,
                          builder: (context) =>
                              CountryBottomSheetWidget(country: country));
                    },
                    title: Text(
                      country.country,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: SubtitleCountry(country: country),
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

class SubtitleCountry extends StatelessWidget {
  const SubtitleCountry({
    Key key,
    @required this.country,
  }) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        LabelIndicator(
          title: 'Recovered',
          color: Colors.lightGreen,
          value: country.totalRecovered,
        ),
        LabelIndicator(
          title: 'Deaths',
          color: Colors.deepOrange,
          value: country.totalDeaths,
        ),
        LabelIndicator(
          title: 'Confirmed',
          color: Colors.orange,
          value: country.totalConfirmed,
        ),
      ],
    );
  }
}
