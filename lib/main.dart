import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amends',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'AMENds'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'My Amends'),
    Tab(text: 'Transactions'),
    Tab(text: 'Rules')
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const Text('My amends'),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              buildAmendListing(context, "Bought Something From Someone Sketchy", "Amends to charity X"),
              buildAmendListing(context, "bought stuff", "Amends to charity Y"),
              buildAmendListing(context, "bought stuff", "Amends to charity Y"),
              buildAmendListing(context, "bought stuff", "Amends to charity Y"),
              buildAmendListing(context, "bought stuff", "Amends to charity Y")
            ],
          ),
          const Text('Rules')
        ],
      ),
    );
  }
}

Widget buildAmendListing(BuildContext context, String listing,
    String description) => Padding(
  padding: new EdgeInsets.all(10.0),
  child: new Card(
    child: new Column(
      children: <Widget>[
        new ListTile(
          title: Text(listing),
          subtitle: Text(description),
        ),
        new ButtonTheme.bar(
          child: new ButtonBar(
            children: <Widget>[
              new FlatButton(
                child: const Text('Ignore'),
                onPressed: () { /* ... */ },
              ),
              new FlatButton(
                child: const Text('Pay'),
                onPressed: () { /* ... */ },
              ),
            ],
          ),
        ),
      ],
    ),
  )
);

/*
Widget buildAmendListing(BuildContext context, String listing) => Container(
  height: 56.0, // in logical pixels
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  decoration: BoxDecoration(color: Colors.purple[100]),
  // Row is a horizontal, linear layout.
  child: Row(
    // <Widget> is the type of items in the list.
    children: <Widget>[
      // Expanded expands its child to fill the available space.
      Expanded(
        child: Text(listing),
      ),
      IconButton(
        icon: Icon(Icons.arrow_forward),
        tooltip: 'Amend details',
        onPressed: null,
      ),
    ],
  ),
);*/
