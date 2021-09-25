import 'package:flutter/material.dart';

class ShowText extends StatelessWidget {
  String content;
  BoxConstraints constrains;

  ShowText(this.content, this.constrains, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: constrains.maxHeight * 0.02),
        width: constrains.maxWidth<600? constrains.maxWidth*0.82 : constrains.maxWidth * 0.62,
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
