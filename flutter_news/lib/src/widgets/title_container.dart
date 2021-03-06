import 'package:flutter/material.dart';

class TileContainer extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget count;
  final Function onTap;

  TileContainer(this.title, this.subtitle, this.count, [this.onTap]);

  TileContainer.skeleton()
      : title = Row(children: <Widget>[Skeleton.title()]),
        subtitle = Row(children: <Widget>[Skeleton.subtitle()]),
        count = Skeleton.count(),
        onTap = null;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            onTap: onTap,
            title: title,
            subtitle: subtitle,
            trailing: Column(
              children: <Widget>[
                Icon(Icons.comment),
                count,
              ],
            ),
          ),
          Divider(height: 8),
        ],
      );
}

class Skeleton extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  Skeleton(this.color, this.height, this.width);

  Skeleton.title()
      : color = Colors.grey[300],
        height = 20,
        width = 240;

  Skeleton.subtitle()
      : color = Colors.grey[200],
        height = 18,
        width = 120;

  Skeleton.count()
      : color = Colors.grey[200],
        height = 16,
        width = 32;

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        height: height,
        width: width,
        margin: EdgeInsets.only(top: 4, bottom: 4),
      );
}
