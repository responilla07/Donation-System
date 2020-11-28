import 'package:cached_network_image/cached_network_image.dart';
import 'package:donation_system/Models/CharityModel.dart';
import 'package:flutter/material.dart';


class CharityItemCard extends StatelessWidget {
  const CharityItemCard({
    Key key,
    @required this.charityModel,
  }) : super(key: key);

  final CharityModel charityModel;

  @override
  Widget build(BuildContext context) {
    // CharityModel charityModel

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
                  imageUrl: charityModel.pictures[0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 250,
                    child: Center(
                      child: Text(""),
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
                  children: currentCardChildrens(charityModel)
                ),
              ),
            ),
          ],
        )
      ),
      elevation: 8.0,
    );
  }

  ////THIS IS FOR THE [CARDS OF THE CHARITY]
  currentCardChildrens(CharityModel charityModel) {
    List<Widget> charityCardChildren = [];
    List<String> charityDetailsSample = [ 
      charityModel.contact,
      (charityModel.location.state + ', ' + charityModel.location.province + (charityModel.location.street == '' ? ('') : (', ' + charityModel.location.street)) ),
      charityModel.description,
    ];
    
    charityCardChildren.add( Text( //Charity name
      charityModel.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),);
    
    for (int detail = 0; detail < 3; detail++) {
      charityCardChildren.add( detail == 2 ? SizedBox(height: 5,) : Container());
      charityCardChildren.add( Text(
        charityDetailsSample[detail],
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontStyle: detail == 2 ? FontStyle.italic : null
        ),
        maxLines: detail == 0 || detail == 1 ? 1 : 2,
        overflow: TextOverflow.ellipsis,
      ),);
    }

    return charityCardChildren;
  }
}