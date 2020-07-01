import 'package:flutter/material.dart';

class LabelIndicator extends StatelessWidget {
  final Color color;
  final String title;
  final int value;

  const LabelIndicator({Key key, this.color, this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: color,
              maxRadius: 6,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(title),
          ],
        ),
        Text('$value')
      ],
    );
  }
}
