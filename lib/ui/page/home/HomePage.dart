import 'package:flocalevents/AppState.dart';
import 'package:flocalevents/StyleGuide.dart';
import 'package:flocalevents/model/Category.dart';
import 'package:flocalevents/model/Event.dart';
import 'package:flocalevents/ui/page/event/EventDetailPage.dart';
import 'package:flocalevents/ui/widget/CategoryWidget.dart';
import 'package:flocalevents/ui/widget/EventCategory.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePageBackground.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: <Widget>[
                          Text("EVEMTOS LOCAIS"),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Novidade",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Consumer<AppState>(
                        builder: (ctx, appState, _) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final categoria in categories)
                                CategoryWidget(
                                  categoria: categoria,
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Consumer<AppState>(
                          builder: (ctx, appState, _) => Column(
                                children: <Widget>[
                                  for (final event in events.where((e) => e
                                      .categoryIds
                                      .contains(appState.selectedCategoryId)))
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>EventDetailPage(event:event)));
                                      },
                                      child: EventWidget(
                                        evento: event,
                                      ),
                                    )
                                ],
                              )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
