import 'package:flutter/material.dart';
import 'detail_chip.dart';

class CarCard extends StatefulWidget {
  const CarCard({super.key,
  required this.rating,
  required this.image,
  required this.name,
  required this.className,
  required this.price,
  required this.transmissionType,
  required this.fuelType,
  required this.seat,
  });
  final double rating;
  final String image;
  final String name;
  final String className;
  final double price;
  final String transmissionType;
  final String fuelType;
  final int seat; 
  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 280,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0),
            blurRadius: 2,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            alignment: Alignment.center,
            width: 330,
            height: 140,
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 246, 246, 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(children: [
              
              Container(
                child: Image.network(
                  widget.image,
                  width: 300,
                  height: 120,
                  fit: BoxFit.cover,)),
              Container(
                width: 300,
                height: 40,
                //color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 60,height: 27,child: 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.orange,),
                          Text(widget.rating.toString(), style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 16),),
                        ],
                      ),),
                  FavoriteIconButton(isFavorite: false,),
                ],),
              ),
            ],),
          ),
          
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(246, 246, 246, 1),
                    ),
                    child: const Padding(
                      padding: const EdgeInsets.only(top: 2,bottom: 2,left: 8,right: 8),
                      child: Text(
                            'SUV',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange,size: 25,),
                      Text(
                        '4.7',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              
              /////// - name
              const SizedBox(height: 8.0),
    
              Text(
              
                widget.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                color: Color.fromRGBO(121, 121, 121, 0.5),
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailChip(text: widget.transmissionType, icon: Icons.settings),
                  DetailChip(text: widget.fuelType, icon: Icons.local_gas_station),
                  DetailChip(text: widget.seat.toString() + "seats", icon: Icons.people),
              ],)

        ],),
      ),
    );
  }
}

class FavoriteIconButton extends StatefulWidget {
  final bool isFavorite;

  FavoriteIconButton({Key? key, required this.isFavorite}) : super(key: key);

  @override
  _FavoriteIconButtonState createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36, 
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          iconColor: WidgetStateProperty.all(Colors.red),
          iconSize: WidgetStateProperty.all(20),
          shape: WidgetStateProperty.all(const CircleBorder()),
          side: WidgetStateProperty.all(
            const BorderSide(
              color: Color.fromRGBO(204, 204, 204, 1),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
      ),
    );
  }
}