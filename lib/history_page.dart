import 'package:flutter/material.dart';

import 'localization.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translateString('history')),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false)),
      ),
      body: DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                constraints: BoxConstraints.expand(
                  height: 50.0,
                ),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xFFC89C17),
                  tabs: [
                    Tab(text: AppLocalizations.of(context).translateString('current')),
                    Tab(text: AppLocalizations.of(context).translateString("in_process")),
                    Tab(text: AppLocalizations.of(context).translateString("canceled")),
                    Tab(text: AppLocalizations.of(context).translateString("completed")),


                  ],
                  labelColor: Color(0xFFC89C17),

               //  labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  labelStyle: TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.black87,
                  unselectedLabelStyle: TextStyle(fontSize: 14),

                ),
              ),
              Expanded(
                  child: Container(
                child: TabBarView(children: [
                  Center(
                    child: Container(
                      child: Text("Current Body"),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text("INProcess Body"),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text("Canceled Body"),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text(" Completed Body"),
                    ),
                  ),
                ]),
              ))
            ],
          )),
    );
  }
}
