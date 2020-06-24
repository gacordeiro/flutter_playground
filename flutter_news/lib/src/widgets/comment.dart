import 'package:flutter/material.dart';
import 'package:news/src/models/item_model.dart';
import 'package:news/src/widgets/title_container.dart';

class Comment extends StatelessWidget {
  final double level;
  final int itemId;
  final Map<int, Future<ItemModel>> cache;

  Comment(this.level, {this.itemId, this.cache});

  @override
  Widget build(BuildContext context) {
    return buildComment(itemId);
  }

  Widget buildComment(int commentId) {
    return FutureBuilder(
      future: cache[commentId],
      builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
        return !itemSnapshot.hasData ? idented(Skeleton.subtitle()) : buildCommentTree(itemSnapshot.data);
      },
    );
  }

  Widget buildCommentTree(ItemModel item) {
    List<Widget> detailsList = [];
    if (item.text.isNotEmpty) {
      detailsList.add(buildCommentTile(item));
      item.kids.forEach((kidId) => detailsList.add(Comment(level + 1, itemId: kidId, cache: cache)));
    }
    return Column(children: detailsList);
  }

  Widget buildCommentTile(ItemModel item) {
    return idented(
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400], width: 1),
        ),
        child: ListTile(title: Text(cleanText(item.text)), subtitle: Text(item.by)),
      ),
    );
  }

  Widget idented(Widget widget) => Container(
        margin: EdgeInsets.only(left: 16 + (24 * level), right: 16),
        child: widget,
      );
}

String cleanText(String text) {
  return text
      .replaceAll("&#x27;", "'")
      .replaceAll("&#x2F;", "/")
      .replaceAll("<p>", "\n\n")
      .replaceAll('</p>', "")
      .replaceAll('<i>', "")
      .replaceAll('</i>', "")
      .replaceAll('<b>', "")
      .replaceAll('</b>', "")
      .replaceAll('&gt;', ">")
      .replaceAll('&lt;', "<")
      .replaceAll('&quot;', "'");
}
