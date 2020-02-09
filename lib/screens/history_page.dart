import 'package:flutter/material.dart';

import '../localization.dart';
import 'current_service.dart'as current;
import 'inprocess_screen.dart'as inprocess;
import 'canceled_screen.dart'as canceled;
import 'completed_screen.dart'as completed;





class HistoryPage extends StatelessWidget {
  static final GlobalKey myTapHistoryPageKey = new GlobalKey<_HistoryScreenState>();

  //static final String hh='key';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:new  HistoryScreen(),
      key: myTapHistoryPageKey,
    );
  }
}




class HistoryScreen extends StatefulWidget {

  const HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>with SingleTickerProviderStateMixin {
  TabController tabController;


  @override
  void initState() {
    tabController=new TabController(length: 4, vsync: this);
    super.initState();

  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('history'),
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
                  controller: tabController,
                  isScrollable: true,
                  indicatorColor: Color(0xFFC89C17),
                  tabs: [
                    Tab(text: ('Current'),),
                    Tab(text: ("In Process")),
                    Tab(text: ("Canceled")),
                    Tab(text: ("Completed")),


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
                child: TabBarView(
                  controller: tabController,
                    children: [

                    current.HistoryCard(),
                      inprocess.InProcessScreen(),
                      canceled.CanceledPage(),
                      completed.CompletedPage(),


                ]),
              ))
            ],
          )),
    );
  }
}
