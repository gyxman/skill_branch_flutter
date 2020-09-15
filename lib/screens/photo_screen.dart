import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {Key key,
      this.name = '',
      this.userName = '',
      this.photoLink = '',
      this.altDescription = ''})
      : super(key: key);

  final String name;
  final String userName;
  final String photoLink;
  final String altDescription;

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImageState();
  }
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppColors.grayChateau),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Photo"),
          centerTitle: true,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Photo(
                photoLink: widget.photoLink,
              ),
              Description(
                text: widget.altDescription,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  children: <Widget>[
                    UserAvatar(
                        'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Name(name: widget.name),
                        Nickname(userName: widget.userName),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 105,
                      height: 36,
                      alignment: Alignment.center,
                      child: LikeButton(10, true),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Button(
                        text: 'Save',
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Button(
                        text: 'Visit',
                      ),
                    ),
                  ],
                ),
              ),
            ]));
  }
}

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

class Name extends StatelessWidget {
  Name({this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(this.name, style: AppStyles.h1Black);
  }
}

class Nickname extends StatelessWidget {
  Nickname({this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text('@${this.userName}',
        style: AppStyles.h5Black.copyWith(color: AppColors.manatee));
  }
}