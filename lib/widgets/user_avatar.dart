import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar(this.avatarLink);

  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          imageUrl: avatarLink,
          width: 40,
          height: 40,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.fill,
        ));
  }
}