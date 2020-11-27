import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16/7,
      child: Container(
        child: ClipRRect(
          child: Carousel(
            boxFit: BoxFit.cover,
            autoplay: true,
            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(milliseconds: 1000),
            showIndicator: false,
            images: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.8),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 3
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: 'https://e-cif.redcross.org.ph/images/cover.png',
                    fit: BoxFit.cover,
                    placeholder: (context, value){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)),
                        ],
                      );
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.8),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 3
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: 'https://static.tripzilla.com/thumb/4/4/36932_700x.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, value){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)),
                        ],
                      );
                    },
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.8),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                      spreadRadius: 3
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: 'https://1zr10d273dd12uxogy1gcbd8-wpengine.netdna-ssl.com/wp-content/uploads/2017/06/kalayupdate-5.jpeg',
                    fit: BoxFit.cover,
                    placeholder: (context, value){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(redSecondaryColor)),
                        ],
                      );
                    },
                  ),
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}

