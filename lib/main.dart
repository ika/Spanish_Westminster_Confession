import 'package:confesion_de_fe_de_westminster/chaptersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:confesion_de_fe_de_westminster/detailPage.dart';
import 'package:confesion_de_fe_de_westminster/dbhelper.dart';
import 'package:flutter/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    if (chapters == null) {
      chapters = List<Chapter>();
      updateChapters();
    }

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
          Future.delayed(const Duration(milliseconds: 200), () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => DetailPage(chapters, index)));
          });
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

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0))),
          context: context,
          builder: (BuildContext bc) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.share),
                      title: new Text('Comparte esta aplicación'),
                      onTap: () => {
                            Navigator.pop(context),
                            Share.share(
                                'La Confesión de Fe de Westminster https://play.google.com/store/apps/details?id=org.armstrong.ika.confesion_de_fe_de_westminster')
                          }),
                ],
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      //bottomNavigationBar: makeBottom,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.grey,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.add, color: Colors.white),
      ),
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
