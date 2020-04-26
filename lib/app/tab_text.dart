import 'package:flutter/material.dart';
import 'package:video_game_ui/layout/text_style.dart';

class TabText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTabTap;

  const TabText({Key key, this.text, this.isSelected = false, this.onTabTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -1.58,
      child: InkWell(
        onTap: onTabTap,
        child: AnimatedDefaultTextStyle(
          style: isSelected ? selectedTabStyle : defaultTabStyle,
          duration: const Duration(microseconds: 500),
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
