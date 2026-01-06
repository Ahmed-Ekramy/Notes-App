import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
final  String title;
 final   Icon icon;

  const CustomAppBar({super.key, required this.title, required this.icon});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),

            child: icon,
          ),
        ],
      ),
    );
  }
}
