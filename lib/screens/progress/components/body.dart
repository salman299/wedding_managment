import 'package:flutter/material.dart';
import 'package:wedding_management/screens/progress/components/progress_list.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ProgressList()
        ),
      ],
    );
  }
}
