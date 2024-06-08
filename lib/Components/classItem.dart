import 'package:flutter/material.dart';

class ClassItem extends StatelessWidget {
  final String name;
  final IconData icon;

  ClassItem(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(10.0),
      
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30),
          ),
          SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}








