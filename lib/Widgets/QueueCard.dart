import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Classes/CharityPageClass.dart';
import 'package:donation_system/Variables/size.dart';
import 'package:flutter/material.dart';

class CharityItemCard extends StatefulWidget {
  const CharityItemCard({
    @required this.charityPageClass,
  });
  final CharityPageClass charityPageClass;

  @override
  _CharityItemCardState createState() => _CharityItemCardState();
}

class _CharityItemCardState extends State<CharityItemCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 250,
        child: Stack(
          children: [
            Positioned(
              bottom: 0, top: 0,
              left: 0, right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: "https://www.childup.com/user/pages/01.blog/what-children-need-to-know-about-math-at-kindergarten-entry/AELF.jpg",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 250,
                    child: Center(
                      child: Text("Loading picture..."),
                    )
                  ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.40, .95],
                  colors: [
                    Colors.black.withOpacity(0.77),
                    Colors.black.withOpacity(0.15),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.charityPageClass.currentQueuCardChildrens()
                ),
              ),
            ),
          ],
        )
      ),
      elevation: 8.0,
    );
  }
}
