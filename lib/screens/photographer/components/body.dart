import 'package:flutter/material.dart';
import '../components/photographer_grid.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PhotographerGrid(),
        ),
      ],
    );
  }
}
