import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';

class ProfileInfoTile extends StatelessWidget {
  final String email;
  final String username;
  final String image;
  const ProfileInfoTile({Key? key, required this.email, required this.username, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: kSecondaryLightColor,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username.toUpperCase(),style: TextStyle(fontSize: 22,),),
                SizedBox(height: 10,),
                Text(email, style: TextStyle(fontSize: 12),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
