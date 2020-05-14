import 'package:flutter/material.dart';
import 'package:flutterpics/src/models.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: images.length,
        itemBuilder: buildItem,
      );

  Widget buildItem(BuildContext context, int index) => cardFrom(images[index]);

  Widget cardFrom(ImageModel model) => Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Image.network(model.url),
            ),
            Text(model.title),
          ],
        ),
      );
}
