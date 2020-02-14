import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/localization.dart';
import 'package:flutter_openthedoor/models/providerCardModel.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'package:flutter_openthedoor/widgets/providerCard.dart';

import 'drawer.dart';

class SelectProvider extends StatefulWidget {
  @override
  _SelectProviderState createState() => _SelectProviderState();
}

class _SelectProviderState extends State<SelectProvider> {
  List<ProviderCardModel> provider = new List();

  @override
  void initState() {
    super.initState();
    getProviders();
  }

  getProviders() async {
    ApiProvider api = new ApiProvider();
    provider = await api.getProviders();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).text("select_provider")),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: provider.length,
            itemBuilder: (BuildContext context, int index) {
              return ProviderCard(
                id: provider[index].providerId,
                name: provider[index].name,
                rating: provider[index].ratCount,
                price: provider[index].servicePrice,
              );
            },
          ),
        ),
      ),
    );
  }
}
