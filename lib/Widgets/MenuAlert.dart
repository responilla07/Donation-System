import 'package:donation_system/Presentation/custom_icons_icons.dart';
import 'package:flutter/material.dart';


Future showMenuAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 230,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      height: 70,
                      child: Image(
                        image: AssetImage('assets/placeholders/noprofilepic.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          "John Doe Mayers",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        Text("See your Profile"),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              CustomMenuTile(icon:Icons.settings,text:'Settings and Privacy'),
              CustomMenuTile(icon:CustomIcons.info,text:'Information'),
              CustomMenuTile(icon:CustomIcons.logout,text:'Log Out'),
            ],
          ),
        ),
      );
    },
  );
}

class CustomMenuTile extends StatelessWidget {
  const CustomMenuTile({
    Key key, @required this.icon, @required this.text
  }) : super(key: key);

final IconData icon;
final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text(
            '$text',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          new Spacer(),
          Icon(CustomIcons.next,size: 15,),
        ],
      ),
    );
  }
}
