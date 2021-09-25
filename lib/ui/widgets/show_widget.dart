import 'package:flutter/material.dart';

/*
To show Text widget with its container with padding
 */

class ShowText extends StatelessWidget {
  final String content;
  final BoxConstraints constrains;

  const ShowText(this.content, this.constrains, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: constrains.maxHeight * 0.02),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
