import 'package:flutter/material.dart';
import 'package:video_game_ui/app/app_background.dart';
import 'package:video_game_ui/app/lavel_value_widget.dart';
import 'package:video_game_ui/layout/colors.dart';
import 'package:video_game_ui/layout/text_style.dart';
import 'package:video_game_ui/models/forum.dart';
import 'package:video_game_ui/models/topic.dart';

class DetailsPage extends StatefulWidget {
  final Forum forum;

  DetailsPage({this.forum});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _fadeAnimation;
  Animation<double> _scaleAnimation;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(_controller);
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(
            firstColor: firstOrangeCircleColor,
            secondColor: secondOrangeCircleColor,
            thirdColor: thirdOrangeCircleColor,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: _playAnimation(),
                    builder: (context, snapshot) {
                      return FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              LabelValueWidget(
                                value: widget.forum.topics.length.toString(),
                                label: "topics",
                                labelStyle: whiteLabelTextStyle,
                                valueStyle: whiteValueTextStyle,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              LabelValueWidget(
                                value: widget.forum.threads,
                                label: "threads",
                                labelStyle: whiteLabelTextStyle,
                                valueStyle: whiteValueTextStyle,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              LabelValueWidget(
                                value: widget.forum.subs,
                                label: "subs",
                                labelStyle: whiteLabelTextStyle,
                                valueStyle: whiteValueTextStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Hero(
                tag: widget.forum.title,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(60.0)),
                  child: Image.asset(
                    widget.forum.imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(60.0)),
              child: Container(
                height: 200.0,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Topics",
                        style: subHeadingStyle.copyWith(fontSize: 26),
                      ),
                      Expanded(
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: ListView.builder(
                            itemCount: widget.forum.topics.length,
                            itemBuilder: (context, index) {
                              return TopicsTile(
                                  topic: widget.forum.topics[index]);
                            },
                            shrinkWrap: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            right: 15,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.forum.rank,
                    style: rankBigStyle,
                  ),
                ),
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicsTile extends StatelessWidget {
  final Topic topic;

  TopicsTile({this.topic});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topic.question,
                style: topicQuestionTextStyle,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: primaryColor,
                ),
                child: Text(
                  topic.answerCount,
                  style: topicAnswerCountTextStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              topic.recentAnswer,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: topicAnswerTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
