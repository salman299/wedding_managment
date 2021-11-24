import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  final Size preferredSize;

  final String title;
  const CustomAppBar({Key? key, required this.title}) : preferredSize = const Size.fromHeight(120) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: CustomPaint(
        size: Size(SizeConfig.screenWidth!, 100),
        painter: CustomShape1(),
        child: Center(child: Text(title,style: const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 20),)),
      ),
      automaticallyImplyLeading: true,
      // flexibleSpace: ClipPath(
      //     clipper: Customshape(),
      //     child: Container(
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           boxShadow: [BoxShadow(
      //             color: Colors.black.withOpacity(0.16),
      //             blurRadius: 20,
      //             offset: Offset.zero,
      //           )]
      //       ),
      //       width: SizeConfig.screenWidth,
      //       child: Center(child: Text(title,style: const TextStyle(color: kPrimaryColor),)),
      //     ),
      //   ),
    );
  }
}

class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    print(size.height);
    print(size.width);
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}


class CustomShape1 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.0;

    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.black.withOpacity(0.10), 4.0, false);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}