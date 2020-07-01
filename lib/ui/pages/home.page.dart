import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/ui/widgets/buttons.widgets.dart';
import 'package:tech_talent_accelerator/ui/widgets/home.widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Covid App',
            ),
          ),
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              const Text('Countries'),
              const Text('Global'),
            ],
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Country'),
                    Spacer(),
                    SortButton(),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      const CountriesContent(),
                      FlutterLogo(
                        colors: Colors.green,
                      ),
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
