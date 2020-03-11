import 'package:flocalevents/model/Event.dart';
import 'package:flocalevents/ui/page/event/EventDetailBackground.dart';
import 'package:flocalevents/ui/page/event/EventDetailContent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailPage extends StatelessWidget {

  final Event event;

  const EventDetailPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(value: event
      , child: Stack(
          fit: StackFit.expand,
            children: <Widget>[
              EventDetailBackground(),
              EventDetailsContent()
            ],
        ),),
    );
  }
}
