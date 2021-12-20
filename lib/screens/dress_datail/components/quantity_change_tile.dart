import 'package:flutter/material.dart';

class QuantityTile extends StatefulWidget {
  final Color color;
  final int initialValue;
  final Function onChange;

  const QuantityTile({Key? key, required this.onChange , this.initialValue=1, this.color=Colors.black}) : super(key: key);

  @override
  State<QuantityTile> createState() => _QuantityTileState();
}

class _QuantityTileState extends State<QuantityTile> {
  int quantity = 0;

  @override
  void initState() {
    // TODO: implement initState
    quantity = widget.initialValue;
    super.initState();
  }

  void add(){
    if (quantity < 20){
      setState(() {
        quantity+=1;
      });
      widget.onChange(quantity);
    }
  }

  void remove(){
    if (quantity >1){
      setState(() {
        quantity-=1;
      });
      widget.onChange(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.06),
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(22), topLeft: Radius.circular(22)),
          ),
          child: GestureDetector(
            onTap: remove,
            child: const Icon(Icons.remove_rounded),
          ),
        ),
        Container(
          height: 30,
          color: widget.color.withOpacity(0.06),
          alignment: Alignment.center,
          child: Text(quantity.toString()),
        ),
        Container(
          height: 30,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration:  BoxDecoration(
            color: widget.color.withOpacity(0.06),
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(22), topRight: Radius.circular(22)),
          ),
          child: GestureDetector(
            onTap: add,
            child: const Icon(Icons.add_rounded),
          ),
        ),
      ],
    );
  }
}
