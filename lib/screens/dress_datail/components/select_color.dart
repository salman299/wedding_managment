import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

class SelectColor extends StatefulWidget {
  List<Color> colors;
  List<String> values;
  Function onChanged;
  SelectColor({Key? key, required this.colors, required this.values, required this.onChanged}) : super(key: key);

  @override
  _SelectColorState createState() => _SelectColorState();
}

class _SelectColorState extends State<SelectColor> {
  int activeColor=0;

  void onChanged(int index){
    setState(() {
      activeColor=index;
    });
    widget.onChanged(widget.values[activeColor]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
      child: Wrap(
        spacing: 10,
        children: widget.colors.asMap().entries.map((item)=>
            GestureDetector(
              onTap: ()=>onChanged(item.key),
              child: Container(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: item.value,
                  borderRadius: BorderRadius.circular(3),
                  border: activeColor != item.key ? null : Border.all(color: kPrimaryColor, width: 2)
                ),
              ),
            )
        ).toList(),
      ),
    );
  }
}
