import 'package:flutter/material.dart';
import 'package:flutter_openthedoor/localization.dart';
import 'package:flutter_openthedoor/models/serviceDetails.dart';
import 'package:flutter_openthedoor/utili/apiProvider.dart';
import 'inprocess_screen.dart' as inprocess;
import 'canceled_screen.dart' as canceled;
import 'completed_screen.dart' as completed;
import 'current_service.dart' as current;

class HistoryPage extends StatelessWidget {
  static final GlobalKey myTapHistoryPageKey =
      new GlobalKey<_HistoryScreenState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HistoryScreen(),
      key: myTapHistoryPageKey,
    );
  }
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  List<ServiceDetailsModel> currentOrders = new List();
  List<ServiceDetailsModel> inProcessOrders = new List();
  List<ServiceDetailsModel> cancelOrders = new List();
  List<ServiceDetailsModel> completedOrders = new List();

  getHistory() async {
    ApiProvider api = new ApiProvider();
    var lists = await api.getHistory();
    cancelOrders = lists[3];
    currentOrders = lists[2];
    inProcessOrders = lists[1];
    completedOrders = lists[0];
    setState(() {});
  }

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
    getHistory();
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
        title: Text('History'),
        backgroundColor: Color(0xFFC89C17),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => {Navigator.pop(context, false)}),
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
                    Tab(
                      text: ("Current"),
                    ),
                    Tab(text: ('In Process')),
                    Tab(text: ('Canceled')),
                    Tab(text: ('Completed')),
                  ],
                  labelColor: Color(0xFFC89C17),
                  labelStyle: TextStyle(fontSize: 15),
                  unselectedLabelColor: Colors.black87,
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                  child: Container(
                child: TabBarView(controller: tabController, children: [
                  current.HistoryCard(
                    list: currentOrders,
                  ),
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
