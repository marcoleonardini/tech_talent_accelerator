import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/ui/widgets/circle_tab_indicator.dart';
import 'package:tech_talent_accelerator/ui/widgets/global.widget.dart';
import 'package:tech_talent_accelerator/ui/widgets/home.widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Covid App',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          bottomNavigationBar: TabBar(
            labelStyle: Theme.of(context).textTheme.headline5,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black38,
            labelPadding: EdgeInsets.only(bottom: 12.0),
            indicator: CircleTabIndicator(radius: 5, color: Colors.blue),
            tabs: <Widget>[
              const Text('Countries'),
              const Text('Global'),
            ],
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.1),
                  BlendMode.dstATop,
                ),
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  'images/who.png',
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      const CountriesContent(),
                      GlobalContent()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
