import 'package:flutter/material.dart';
import 'package:video_game_ui/app/app_background.dart';
import 'package:video_game_ui/app/horizontal_tab_layout.dart';
import 'package:video_game_ui/layout/colors.dart';
import 'package:video_game_ui/layout/text_style.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstCircleColor,
            secondColor: secondCircleColor,
            thirdColor: thirdCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  HeadingSubHeadingWidget(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Material(
                      elevation: 10.0,
                      color: Colors.white,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.apps,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              HorizontalTabLayout(),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    child: Text(
                      'New Topic',
                      style: buttonStyle,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HeadingSubHeadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Forum',
            style: headingStyle,
          ),
          Text(
            'Kick of conversation',
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}
