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
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Covid App',
              style: Theme.of(context).textTheme.headline5,
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
            padding: EdgeInsets.all(16.0),
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
