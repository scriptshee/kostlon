// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kostlon/utils/color_theme.dart';

class ProfileMemberScreen extends StatelessWidget {
  ProfileMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        CircleAvatar(
          backgroundColor: AppColor.secondary,
          child: Text(
            'AH',
            style: TextStyle(fontSize: 30),
          ),
          maxRadius: 50,
          minRadius: 50,
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(
            'Budi sulaiman',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(
            '08770999',
            style: TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text(
            'email@email.com',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
