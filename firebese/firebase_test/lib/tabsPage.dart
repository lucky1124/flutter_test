import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({Key? key, required this.observer}) : super(key: key);

  final FirebaseAnalyticsObserver observer;

  @override
  _TabsPageState createState() => _TabsPageState(observer);
}

class _TabsPageState extends State<TabsPage> with SingleTickerProviderStateMixin, RouteAware {

  _TabsPageState(this.observer);

  final FirebaseAnalyticsObserver observer;


  late TabController _controller;
  int selectedIndex = 0;

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: '1번',
      icon: Icon(Icons.looks_one),
    ),
    const Tab(
      text: '2번',
      icon: Icon(Icons.looks_two),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this,
    initialIndex: selectedIndex);
    _controller.addListener(() {
      setState(() {
        if(selectedIndex != _controller.index){
          selectedIndex = _controller.index;
          _sendCurrentTab();
        }
      });
    });
  }

  void _sendCurrentTab() {
    observer.analytics.setCurrentScreen(screenName: 'tab/$selectedIndex');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    observer.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    observer.unsubscribe(this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: tabs,
        )
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((Tab tab) {
          return Center(
            child: Text(tab.text!),
          );
        }).toList(),
      ),
    );
  }

}
