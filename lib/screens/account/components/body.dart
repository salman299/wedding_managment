import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/providers/settings.dart';
import 'package:wedding_management/screens/account/components/profile_info_tile.dart';
import 'package:wedding_management/screens/account/components/setting_tile.dart';
import 'package:wedding_management/screens/account/components/welcome_user.dart';
import 'package:wedding_management/screens/order/order_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  void onLogout(context){
    Provider.of<Auth>(context, listen: false).signOut();
    Provider.of<AppSettings>(context, listen: false).setPageIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    final String? isUser = Provider.of<Auth>(context, listen: false).userId;
    final String? email = Provider.of<Auth>(context, listen: false).email;
    String? username;
    if (email != null ){
      username = email.split('@')[0];
    }
    return isUser==null ?  const WelcomeUser() :  ListView(
      padding: EdgeInsets.zero,
      children: [
        ProfileInfoTile(email: email!, username: username!, image: 'assets/profile.png'),
        SettingTile(title: 'Orders', iconData: Icons.edit, onClick: ()=>Navigator.of(context).pushNamed(OrderScreen.routeName),),
        SettingTile(title: 'Logout', iconData: Icons.edit, onClick: ()=>onLogout(context),),
      ],
    );
  }
}
