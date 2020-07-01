import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';

class GlobalContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: SizedBox(
              height: 300.0,
              child: Consumer<AppProvider>(
                builder: (context, appProvider, _) {
                  return charts.PieChart(
                    appProvider.globalSeries,
                    animate: true,
                    defaultRenderer: charts.ArcRendererConfig(
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.auto,
                          insideLabelStyleSpec: new charts.TextStyleSpec(
                            fontSize: 14,
                            color: charts.Color.fromHex(code: "#FFFFFF"),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
