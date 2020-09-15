import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/widgets.dart';

class Name extends StatelessWidget {
  Name({this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(this.name, style: AppStyles.h1Black);
  }
}
