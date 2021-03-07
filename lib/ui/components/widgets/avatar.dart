import 'package:flutter/material.dart';
import 'package:fire_starter/models/models.dart';
import 'package:fire_starter/ui/components/components.dart';

class Avatar extends StatelessWidget {
  Avatar(
    this.user,
  );
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'avatar',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          radius: 25.0,
          child: ((user.photoUrl == null) || (user.photoUrl == ''))
              ? Icon(Icons.person)
              : ClipOval(
                  child: Image.network(
                    user.photoUrl!,
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,
                  ),
                )),
    );
  }
}
