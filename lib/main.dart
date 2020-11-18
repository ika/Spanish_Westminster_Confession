import 'package:confesion_de_fe_de_westminster/chaptersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confesion_de_fe_de_westminster/detailPage.dart';
import 'package:confesion_de_fe_de_westminster/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:share/share.dart';

// https://proandroiddev.com/flutter-thursday-02-beautiful-list-ui-and-detail-page-a9245f5ceaf0
// https://www.linkedin.com/pulse/to-do-list-flutter-sqlite-local-database-udara-abeythilake

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spanish Westminster Confession',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'la Confesión de Fe de Westminster'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyListViewBuilder createState() => _MyListViewBuilder();
}

class _MyListViewBuilder extends State<MyHomePage> {
  DBProvider dbProvider = DBProvider();
  List<Chapter> chapters;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (chapters == null) {
      chapters = List<Chapter>();
      updateChapters();
    }

    final makeBottom = Container(
      height: 56.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.share_rounded, color: Colors.yellowAccent),
              onPressed: () {
                Share.share('La Confesión de Fe Westminster https://example.com');
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.blur_on, color: Colors.white),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: Icon(Icons.hotel, color: Colors.white),
            //   onPressed: () {},
            // ),
            // IconButton(
            //   icon: Icon(Icons.account_box, color: Colors.white),
            //   onPressed: () {},
            // )
          ],
        ),
      ),
    );

    ListTile makeListTile(chapters, int index) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        // leading: Container(
        //   padding: EdgeInsets.only(right: 12.0),
        //   decoration: new BoxDecoration(
        //       border: new Border(
        //           right: new BorderSide(width: 1.0, color: Colors.white24))),
        //   child: Icon(Icons.autorenew, color: Colors.white),
        // ),
        title: Text(
          chapters[index].chap,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    text: " " + chapters[index].title),
              ),
            ),
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => DetailPage(chapters, index)),
          // );
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailPage(chapters, index)));
        });

    Card makeCard(chapters, int index) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(chapters, index),
          ),
        );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: chapters == null ? 0 : chapters.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(chapters, index);
        },
      ),
    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      title: Text(widget.title),
      //actions: <Widget>[
      //  IconButton(
      //    icon: Icon(Icons.list),
      //    onPressed: () {},
      //  )
      //],
    );

    // Navigation Rail
    // final navigationRail = Row(
    //   children: [
    //     NavigationRail(
    //       backgroundColor: Color.fromRGBO(64, 75, 96, .9),
    //       selectedIndex: _selectedIndex,
    //       onDestinationSelected: (int index) {
    //         setState(() {
    //           _selectedIndex = index;
    //         });
    //       },
    //       labelType: NavigationRailLabelType.none,
    //       minWidth: 48,
    //       destinations: [
    //         NavigationRailDestination(
    //           icon: Icon(Icons.share, color: Colors.white,),
    //           selectedIcon: Icon(Icons.share, color: Colors.white,),
    //           label: Text('First'),
    //         ),
    //         NavigationRailDestination(
    //           icon: Icon(Icons.star_border, color: Colors.white,),
    //           selectedIcon: Icon(Icons.star, color: Colors.white,),
    //           label: Text('Second'),
    //         ),
    //       ],
    //     ),
    //     VerticalDivider(thickness: 1, width: 1),
    //     Expanded(
    //       child: (
    //           makeBody
    //       ),
    //     )
    //   ],
    // );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }

  void updateChapters() {
    final Future<Database> dbFuture = dbProvider.initDB();
    dbFuture.then((database) {
      Future<List<Chapter>> chapterFuture = dbProvider.getChapters();
      chapterFuture.then((chapters) {
        setState(() {
          this.chapters = chapters;
        });
      });
    });
  }
}
