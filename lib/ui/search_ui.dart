import 'package:fire_starter/ui/components/components.dart';
import 'package:flutter/material.dart';

class SearchUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DataList.builder(
          path: '/users',
          itemBuilder: (Map<dynamic, dynamic> data) {
            return Text(data['name'] ?? data['phone'] ?? data['email']);
          }),
    );
  }
}
