import 'package:flutter/material.dart';

class CharityPageClass {
  List<String> queueDetails = [ "Contact", "Address", "Description", ];
  List<String> queueDetailsSample = [ "In-queue", "Calamba City, Laguna", "The Arcanys Early Learning Foundation offers effective math coaching programs to parents and preschool children from low-income areas of the Philippines.", ];
  List<Widget> queueCardChildren = [];

  List<Widget> queuePostion() {
    List<Widget> queuePostion = [];
    for (var i = 0; i < 5; i++) {
      queuePostion.add(
        Container(
          width: 40,
          margin: const EdgeInsets.only(right: 8, left: 8),
          child: Divider(
            thickness: 5,
            color: i == 0 ? Colors.green : Colors.red,
          )
        )    
      );
    }
    return queuePostion;
  }

  currentQueuCardChildrens() {
    queueCardChildren = [];
    
    queueCardChildren.add( Text( //Charity name
      'Arcanys Early Learning Foundation',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Colors.white,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),);
    queueCardChildren.add(SizedBox(height: 5,));
    
    for (int detail = 0; detail < queueDetails.length; detail++) { //Eto naman yung mag create ng details ng current/latest queue mo
      queueCardChildren.add( Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              queueDetails[detail],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Text( " :   ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              queueDetailsSample[detail],
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),);
    }

    return queueCardChildren;
  }
}