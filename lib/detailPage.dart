import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:confesion_de_fe_de_westminster/chaptersModel.dart';

// https://www.linkedin.com/pulse/to-do-list-flutter-sqlite-local-database-udara-abeythilake

// class Index with ChangeNotifier {
//   int indx;
//
//   Index({this.indx});
//
//   void Change(int i) {
//     indx = i;
//     notifyListeners();
//   }
// }

// class DetailPage extends StatelessWidget {
//   List<Chapter> chapters;
//   int index;
//
//   DetailPage(chapters, int index) {
//     this.chapters = chapters;
//     this.index = index;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => Index(indx: this.index),
//         ),
//       ],
//       child: Page(this.chapters, index),
//     );
//   }
// }

class DetailPage extends StatelessWidget {
  List<Chapter> chapters;
  int index;

  DetailPage(chapters, int index) {
    this.chapters = chapters;
    this.index = index;
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController =
        PageController(initialPage: chapters[index].id);

    final html = Style(
        backgroundColor: Colors.white30,
        padding: EdgeInsets.all(15.0),
        fontFamily: 'Raleway-Regular',
        fontSize: FontSize(16.0));

    final h4 = Style(fontSize: FontSize(18.0));
    final h3 = Style(fontSize: FontSize(16.0));

    final page0 = Html(
      data: chapters[0].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page1 = Html(
      data: chapters[1].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page2 = Html(
      data: chapters[2].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page3 = Html(
      data: chapters[3].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page4 = Html(
      data: chapters[4].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page5 = Html(
      data: chapters[5].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page6 = Html(
      data: chapters[6].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page7 = Html(
      data: chapters[7].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page8 = Html(
      data: chapters[8].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page9 = Html(
      data: chapters[9].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page10 = Html(
      data: chapters[10].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page11 = Html(
      data: chapters[11].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page12 = Html(
      data: chapters[12].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page13 = Html(
      data: chapters[13].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page14 = Html(
      data: chapters[14].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page15 = Html(
      data: chapters[15].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page16 = Html(
      data: chapters[16].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page17 = Html(
      data: chapters[17].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page18 = Html(
      data: chapters[18].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page19 = Html(
      data: chapters[19].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page20 = Html(
      data: chapters[20].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page21 = Html(
      data: chapters[21].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page22 = Html(
      data: chapters[22].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page23 = Html(
      data: chapters[23].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page24 = Html(
      data: chapters[24].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page25 = Html(
      data: chapters[25].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page26 = Html(
      data: chapters[26].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page27 = Html(
      data: chapters[27].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page28 = Html(
      data: chapters[28].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page29 = Html(
      data: chapters[29].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page30 = Html(
      data: chapters[30].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page31 = Html(
      data: chapters[31].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final page32 = Html(
      data: chapters[32].text,
      style: {"html": html, "h4": h4, "h3": h3},
    );

    final topAppBar = AppBar(
          elevation: 0.1,
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text('la Confesión de Fe de Westminster'),
          // title: Text(
          //     "Capítulo ${Provider.of<Index>(context, listen: true).indx + 1}"),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       icon: Icon(Icons.arrow_back_ios),
          //       onPressed: () {
          //         pageController.animateToPage(--index,
          //             duration: Duration(milliseconds: 250),
          //             curve: Curves.bounceInOut);
          //       }),
          //   IconButton(
          //       icon: Icon(Icons.arrow_forward_ios),
          //       onPressed: () {
          //         pageController.animateToPage(++index,
          //             duration: Duration(milliseconds: 250),
          //             curve: Curves.bounceInOut);
          //       }),
          // ],
        );

    return Scaffold(
        appBar: topAppBar,
        body: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          // onPageChanged: (num) {
          //   Provider.of<Index>(context, listen: false).Change(num);
          // },
          children: [
            Container(
                child: SingleChildScrollView(
              child: page0,
            )),
            Container(
                child: SingleChildScrollView(
              child: page1,
            )),
            Container(
                child: SingleChildScrollView(
              child: page2,
            )),
            Container(
                child: SingleChildScrollView(
              child: page3,
            )),
            Container(
                child: SingleChildScrollView(
              child: page4,
            )),
            Container(
                child: SingleChildScrollView(
              child: page5,
            )),
            Container(
                child: SingleChildScrollView(
              child: page6,
            )),
            Container(
                child: SingleChildScrollView(
              child: page7,
            )),
            Container(
                child: SingleChildScrollView(
              child: page8,
            )),
            Container(
                child: SingleChildScrollView(
              child: page9,
            )),
            Container(
                child: SingleChildScrollView(
              child: page10,
            )),
            Container(
                child: SingleChildScrollView(
              child: page11,
            )),
            Container(
                child: SingleChildScrollView(
              child: page12,
            )),
            Container(
                child: SingleChildScrollView(
              child: page13,
            )),
            Container(
                child: SingleChildScrollView(
              child: page14,
            )),
            Container(
                child: SingleChildScrollView(
              child: page15,
            )),
            Container(
                child: SingleChildScrollView(
              child: page16,
            )),
            Container(
                child: SingleChildScrollView(
              child: page17,
            )),
            Container(
                child: SingleChildScrollView(
              child: page18,
            )),
            Container(
                child: SingleChildScrollView(
              child: page19,
            )),
            Container(
                child: SingleChildScrollView(
              child: page20,
            )),
            Container(
                child: SingleChildScrollView(
              child: page21,
            )),
            Container(
                child: SingleChildScrollView(
              child: page22,
            )),
            Container(
                child: SingleChildScrollView(
              child: page23,
            )),
            Container(
                child: SingleChildScrollView(
              child: page24,
            )),
            Container(
                child: SingleChildScrollView(
              child: page25,
            )),
            Container(
                child: SingleChildScrollView(
              child: page26,
            )),
            Container(
                child: SingleChildScrollView(
              child: page27,
            )),
            Container(
                child: SingleChildScrollView(
              child: page28,
            )),
            Container(
                child: SingleChildScrollView(
              child: page29,
            )),
            Container(
                child: SingleChildScrollView(
              child: page30,
            )),
            Container(
                child: SingleChildScrollView(
              child: page31,
            )),
            Container(
                child: SingleChildScrollView(
              child: page32,
            )),
          ],
        ));
  }
}
