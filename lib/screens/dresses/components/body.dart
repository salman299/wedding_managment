import 'package:flutter/material.dart';
import '../components/dress_grid.dart';

class Body extends StatelessWidget {
  final bool isGroomDresses;
  const Body({Key? key, required this.isGroomDresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DressesGrid(isGroomDresses: isGroomDresses,),
        ),
      ],
    );
  }
}
