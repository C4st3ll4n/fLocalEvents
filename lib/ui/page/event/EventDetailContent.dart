import 'package:flocalevents/StyleGuide.dart';
import 'package:flocalevents/model/Event.dart';
import 'package:flocalevents/model/Guest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Text(
                    "-",
                    style: eventWhiteTitleTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "GUESTS",
              style: guestTextStyle,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for(final guest in guests)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: ClipOval(
                      child: Image.asset(guest.imgPath,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,),
                    ),
                  )
              ],
            ),

          ),
          Padding(padding: EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: event.punchLine1, style: punchLine1TextStyle),
                TextSpan(text: event.punchLine2, style: punchLine2TextStyle),
              ]
            ),
          ),),
          if(event.description.isNotEmpty)
            Padding(padding: EdgeInsets.all(16),
            child: Text(event.description, style: eventLocationTextStyle,)),
          if(event.galleryImages.isNotEmpty)
            Padding(padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: Text("GALERIA", style: eventLocationTextStyle,)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for(final galleryImgPath in event.galleryImages)
                  Container(
                    margin: EdgeInsets.only(left: 16,right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(galleryImgPath, width: 180,height: 180,
                      fit: BoxFit.cover,),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
