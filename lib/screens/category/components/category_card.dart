import 'package:flutter/material.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/screens/banquet/banquet.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  const CategoryCard({Key? key, required this.title, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(Banquet.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0,3),
            blurRadius: 6
          )]
        ),
        child: Column(
          children: [
            Image.asset(image),
            // const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(title.toUpperCase(), style: const TextStyle(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.w700),),
            ),

          ],
        ),
      ),
    );
  }
}
