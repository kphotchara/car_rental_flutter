import 'package:flutter/material.dart';

class AppBarDetailBook extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarDetailBook({super.key, required this.title});
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
            shadowColor: Color.fromRGBO(121, 121, 121, 0.1),
            surfaceTintColor: Colors.transparent,
            backgroundColor: Color.fromRGBO(246, 246, 246, 1),
            title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            centerTitle: true,
            leadingWidth: 70,
            leading: IconButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(const Size(45, 45)),
                backgroundColor: WidgetStateProperty.all(Colors.white),
                iconSize: WidgetStateProperty.all(25),
                shape: WidgetStateProperty.all(const CircleBorder()),
                side: WidgetStateProperty.all(const BorderSide(color: Color.fromRGBO(204, 204, 204, 1),width: 1,style: BorderStyle.solid)),
              ),
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(45, 45)),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  iconSize: WidgetStateProperty.all(20),
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  side: WidgetStateProperty.all(const BorderSide(color: Color.fromRGBO(204, 204, 204, 1),width: 1,style: BorderStyle.solid)),
                ),
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              const SizedBox(width: 10,),
              IconButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(const Size(45, 45)),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  iconColor: WidgetStateProperty.all(Colors.red),
                  iconSize: WidgetStateProperty.all(25),
                  shape: WidgetStateProperty.all(const CircleBorder()),
                  side: WidgetStateProperty.all(const BorderSide(color: Color.fromRGBO(204, 204, 204, 1),width: 1,style: BorderStyle.solid)),
                ),
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
             ),
             SizedBox(width: 12.5,)
            ],
          );
  }
}