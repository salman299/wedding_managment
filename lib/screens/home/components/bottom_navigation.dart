import 'package:flutter/material.dart';

import '../../../custom_icons_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentItem;
  final Function onItemTapped;
  const CustomBottomNavigationBar({Key? key, required this.currentItem, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        boxShadow: [BoxShadow(
          offset: const Offset(0,6),
          blurRadius: 22,
          color: Colors.black.withOpacity(0.16),
        )],
      ),
      child: ClipRRect(
        borderRadius:  const BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          //backgroundColor: Colors.white,
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.heart),
              label: 'Liked',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.user),
              label: 'Account',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.book),
              label: "Book",
            ),
          ],
          //unselectedItemColor: Colors.black.withOpacity(0.30),
          currentIndex: currentItem,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (index)=> onItemTapped(index),
        ),
      ),
    );
  }
}
