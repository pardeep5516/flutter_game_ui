import 'package:flutter/material.dart';
import 'package:video_game_ui/app/forum_details_widget.dart';
import 'package:video_game_ui/app/forum_text_widget.dart';
import 'package:video_game_ui/models/forum.dart';
import 'package:video_game_ui/pages/details_page.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  const ForumCard({Key key, this.forum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: forum.title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                forum: forum,
              ),
            ),
          ),
          child: SizedBox(
            width: 250.0,
            child: Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 60.0, horizontal: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 22.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      forum.imagePath,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ForumDetailsWidget(forum: forum),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 80.0,
                      child: ForumNameWidget(
                        forum: forum,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
