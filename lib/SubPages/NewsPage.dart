import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/SubPages/NewsDetails.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:donation_system/Widgets/CacheNetworkImagePlaceholder.dart';
import 'package:donation_system/Widgets/SubPagesAppBar.dart';
import 'package:donation_system/transitions/slide_route.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize( 
        preferredSize: Size.fromHeight(45.0),
        child: SubPagesAppBar(
          title: "News",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            CardNews(
              imageurl: 'https://sa.kapamilya.com/absnews/abscbnnews/media/2020/tvpatrol/11/25/vaccine.jpg',
              headLine: 'Philippines eyes portfolio of potential vaccines vs COVID-19',
              author: 'Davinci Maru, ABS-CBN News',
              dateposted: 'Posted at Nov 27 05:06 PM',
            ),
            CardNews(
              imageurl: 'https://newsinfo.inquirer.net/files/2020/11/DOH-tracker-Nov-25-620x456.png',
              headLine: '6 of 127 NCR hospitals under ‘critical’ level in terms of bed capacity',
              author: 'Cristina Eloisa Baclig',
              dateposted: '11:35 AM November 27, 2020',
            ),
            CardNews(
              imageurl: 'https://newsinfo.inquirer.net/files/2020/05/AP20132728571996-scaled.jpg',
              headLine: 'COVID-19 cases climb to 422,915 with 1,202 new infections',
              author: 'Katrina Hallare',
              dateposted: '04:05 PM November 25, 2020',
            )
          ],
        ),
      ),
    );
  }
}

class CardNews extends StatelessWidget {
  const CardNews({
    Key key, @required this.imageurl, @required this.headLine, @required this.author, @required this.dateposted
  }) : super(key: key);

  final String imageurl;
  final String headLine;
  final String author;
  final String dateposted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:15),
      height: 280,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: redSecondaryColorLight,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl:
                      '$imageurl',
                  fit: BoxFit.cover,
                  placeholder: (context, value) {
                    return CacheNetworkImagePlaceholder();
                  },
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$headLine",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "$author",
                  ),
                  Row(
                    children: [
                      Text(
                        "$dateposted",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            SlideLeftRoute(page: NewsDetails())),
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: redSecondaryColorDark.withOpacity(.8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Read More",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
