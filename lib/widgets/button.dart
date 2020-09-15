import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/widgets.dart';

class Button extends StatelessWidget {
  Button({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.dodgerBlue,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        this.text,
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
