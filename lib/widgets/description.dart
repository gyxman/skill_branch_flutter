import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/widgets.dart';

class Description extends StatelessWidget {
  Description({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(text,
          maxLines: 3, overflow: TextOverflow.ellipsis, style: AppStyles.h3),
    );
  }
}
