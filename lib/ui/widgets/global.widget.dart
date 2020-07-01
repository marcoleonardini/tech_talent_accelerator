import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';
import 'package:tech_talent_accelerator/ui/widgets/label_indicator.widget.dart';

class GlobalContent extends StatelessWidget {
  const GlobalContent();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppProvider>(builder: (context, appProvider, __) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Global Summary',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LabelIndicator(
                  title: 'Confirmed',
                  color: Colors.orange,
                  value: appProvider.globalSummary.totalConfirmed,
                ),
                LabelIndicator(
                  title: 'Recovered',
                  color: Colors.lightGreen,
                  value: appProvider.globalSummary.totalRecovered,
                ),
                LabelIndicator(
                  title: 'Deaths',
                  color: Colors.deepOrange,
                  value: appProvider.globalSummary.totalDeaths,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 350.0,
                child: charts.PieChart(
                  appProvider.globalSerie,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto,
                        insideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 14,
                          color: charts.Color.fromHex(code: "#FFFFFF"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Global Today New Summary',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LabelIndicator(
                  title: 'Confirmed',
                  color: Colors.orange,
                  value: appProvider.globalSummary.newConfirmed,
                ),
                LabelIndicator(
                  title: 'Recovered',
                  color: Colors.lightGreen,
                  value: appProvider.globalSummary.newRecovered,
                ),
                LabelIndicator(
                  title: 'Deaths',
                  color: Colors.deepOrange,
                  value: appProvider.globalSummary.newDeaths,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 350.0,
                child: charts.PieChart(
                  appProvider.globalNewSerie,
                  animate: true,
                  defaultRenderer: charts.ArcRendererConfig(
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.auto,
                        insideLabelStyleSpec: charts.TextStyleSpec(
                          fontSize: 14,
                          color: charts.Color.fromHex(code: "#FFFFFF"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
