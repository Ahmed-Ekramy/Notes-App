import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
final  String title;
 final   Icon icon;
final void Function()onTap;
  const CustomAppBar({super.key, required this.title, required this.icon, required this.onTap, });


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
          InkWell(
            onTap: onTap,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
            
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
