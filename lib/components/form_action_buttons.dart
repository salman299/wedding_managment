import 'package:flutter/cupertino.dart';
import 'package:wedding_management/components/gradient_button.dart';

import 'outline_button.dart';

class FormActionButtons extends StatelessWidget {
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;
  final int activeIndex;
  final int totalItems;
  const FormActionButtons({Key? key, required this.onStepContinue, required this.onStepCancel, required this.activeIndex, required this.totalItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          if (activeIndex > 0)
            Expanded(
                child: CustomOutlineButton(
                    buttonText: 'Back', onPressed: onStepCancel)),
          if (activeIndex > 0)
            const SizedBox(
              width: 10,
            ),
          Expanded(
              child: GradientButton(
                  buttonText:
                  activeIndex == totalItems - 1
                      ? 'Submit'
                      : 'Next',
                  onPressed: onStepContinue)),
        ],
      ),
    );
  }
}
