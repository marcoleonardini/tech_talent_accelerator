import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_talent_accelerator/core/providers/app.provider.dart';

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
                    FlatButton(
                      child: Row(
                        children: <Widget>[Text('Confirmed'), Icon(Icons.sort)],
                      ),
                      onPressed: () {
                        Provider.of<AppProvider>(context, listen: false)
                            .sortContries();
                      },
                    )
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
