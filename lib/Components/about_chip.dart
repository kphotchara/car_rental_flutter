import 'package:flutter/material.dart';

class AboutChip extends StatelessWidget {
  
  const AboutChip({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(246, 246, 246, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2,bottom: 2,left: 8,right: 8),
        child: Row(
          children: [
            Icon(icon, color: Color.fromRGBO(0, 125, 252, 1),size: 20,),
            SizedBox(width: 6,),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(121, 121, 121, 1),
                fontWeight: FontWeight.bold,
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}