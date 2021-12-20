import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

class SelectSize extends StatefulWidget {
  List<String> sizes;
  Function onChanged;
  SelectSize({Key? key, required this.sizes, required this.onChanged}) : super(key: key);

  @override
  _SelectSizeState createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  int activeSize=0;

  void onChanged(index){
    setState(() {
      activeSize=index;
    });
    widget.onChanged(widget.sizes[activeSize]);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10,
        children: widget.sizes.asMap().entries.map((item)=>
            GestureDetector(
              onTap: ()=>onChanged(item.key),
              child: Container(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: const Offset(3,3),

                    )],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    border: activeSize != item.key ? null : Border.all(color: kPrimaryColor)
                ),
                child: Center(child: Text(item.value.toUpperCase(), style: TextStyle( color: activeSize != item.key ? kTextColor :kPrimaryColor,fontWeight: FontWeight.bold),)),
              ),
            )
        ).toList(),
      ),
    );
  }
}
