import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/size_config.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  const CustomContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(
              SizeConfig.screenWidth!, getProportionateScreenHeight(height)), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: RPSCustomPainter(),
        ),
        Column(
          children: [
            Image.asset(
              'assets/wedding.png',
              height: getProportionateScreenHeight(height)*0.25,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              'Solemate',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(height>280? 35: 25)
              ),
            )
          ],
        )
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.6818097);
    path0.quadraticBezierTo(size.width * 0.0172664, size.height * 0.8397015,
        size.width * 0.1580841, size.height * 0.8395522);
    path0.cubicTo(
        size.width * 0.2988551,
        size.height * 0.8444216,
        size.width * 0.2961449,
        size.height * 0.7793843,
        size.width * 0.4610280,
        size.height * 0.8078358);
    path0.cubicTo(
        size.width * 0.6246262,
        size.height * 0.8385448,
        size.width * 0.6880140,
        size.height * 1.0263060,
        size.width * 0.8309813,
        size.height * 0.9906716);
    path0.quadraticBezierTo(size.width, size.height * 0.9210821, size.width,
        size.height * 0.6884328);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
    canvas.drawShadow(path0, Colors.black.withOpacity(0.10), 2.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
