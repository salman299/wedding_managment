import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  const SettingTile({Key? key, required this.title, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.30),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(iconData,color: kSecondaryColor,)
      ),
      title: Text(title, style: const TextStyle(fontSize: 18, color: kTextColor),),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: Colors.black,),
    );
  }
}
