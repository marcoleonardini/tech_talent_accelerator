import 'package:flutter/material.dart';
import 'package:tech_talent_accelerator/core/models/country.model.dart';
import 'package:tech_talent_accelerator/core/services/covid.service.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Covid App'),
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                const Text('Countries'),
                const Text('Global'),
              ],
            ),
          ),
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Country'),
                    Icon(Icons.sort),
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
    return FutureBuilder<List<Country>>(
      future: CovidService().getCountries(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        final _listContry = snapshot.data;
        return ListView.builder(
          itemCount: snapshot.data.length,
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
