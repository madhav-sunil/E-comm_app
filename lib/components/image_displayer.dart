import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final String imageUrl;
  final double scale;
  const ImageDisplay({Key key, @required this.imageUrl, this.scale})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
              child: Icon(
            Icons.person,
            size: 30,
            color: Colors.blue[300],
          )),
          Center(
              child: Image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            image: CacheImage(imageUrl),
          )),
        ],
      ),
    );
  }
}
