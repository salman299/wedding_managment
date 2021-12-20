import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/account/components/profile_info_tile.dart';
import 'package:wedding_management/screens/account/components/setting_tile.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const ProfileInfoTile(email: 'salman.khuwaja29@gmail.com', username: 'Ali Salman', image: 'assets/profile.jpeg'),
        const SettingTile(title: 'Edit Profile', iconData: Icons.edit),
        const SettingTile(title: 'Edit Profile', iconData: Icons.edit),
        const SettingTile(title: 'Edit Profile', iconData: Icons.edit),
      ],
    );
  }
}
