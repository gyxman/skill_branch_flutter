import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/widgets.dart';

class Nickname extends StatelessWidget {
  Nickname({this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text('@${this.userName}',
        style: AppStyles.h5Black.copyWith(color: AppColors.manatee));
  }
}
