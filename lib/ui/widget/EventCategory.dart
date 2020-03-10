import 'package:flocalevents/StyleGuide.dart';
import 'package:flocalevents/model/Event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event evento;

  const EventWidget({Key key, this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                evento.imgPath,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          evento.title,
                          style: eventTitleTextStyle,
                        ),
                        SizedBox(height: 10,),

                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              SizedBox(width: 5,),
                              Text(evento.location,
                              style: eventLocationTextStyle,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(evento.duration.toUpperCase(),
                    textAlign: TextAlign.right,
                    style: eventLocationTextStyle.copyWith(
                      fontWeight: FontWeight.w900
                    ),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
