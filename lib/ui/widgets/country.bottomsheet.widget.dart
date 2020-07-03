import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/ui/widgets/label_indicator.widget.dart';
import 'package:intl/intl.dart';

class CountryBottomSheetWidget extends StatelessWidget {
  final Country country;

  const CountryBottomSheetWidget({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formattedDate =
        DateFormat.yMMMMd('en_US').format(DateTime.parse(country.date));
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            country.country,
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          Text(
            formattedDate,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Total',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              LabelIndicator(
                title: 'Confirmed',
                color: Colors.orange,
                value: country.totalConfirmed,
              ),
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
            ],
          ),
          Text(
            'New',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              LabelIndicator(
                title: 'Confirmed',
                color: Colors.orange,
                value: country.newConfirmed,
              ),
              LabelIndicator(
                title: 'Recovered',
                color: Colors.lightGreen,
                value: country.newRecovered,
              ),
              LabelIndicator(
                title: 'Deaths',
                color: Colors.deepOrange,
                value: country.newDeaths,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
