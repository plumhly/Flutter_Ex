import 'package:flutter/material.dart';
import 'package:flutter_ex/demo/myDrawer.dart';

class ScaffoldRoute extends StatefulWidget {
  ScaffoldRoute({Key key}) : super(key: key);

  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: tabs.length,
      vsync: this
    );
    super.initState();
  }

  void handleSelected(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void add() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App name"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: (){},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Home")
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       title: Text("Bussiness")
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       title: Text("School")
      //     )
      //   ],
      //   currentIndex: _selectedIndex,
      //   fixedColor: Colors.blue,
      //   onTap: handleSelected,
      // ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){},),
            SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: (){},)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: add,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
          );
        }).toList(),
      ),
    );
  }
}