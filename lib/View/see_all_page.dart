import 'package:car_rental_flutter/Components/car_card.dart';
import 'package:car_rental_flutter/Model/car.dart';
import 'package:car_rental_flutter/View/car_detail_page.dart';
import 'package:car_rental_flutter/ViewModel/car.dart';
import 'package:car_rental_flutter/ViewModel/car_retrofit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SeeAllPage extends StatelessWidget {
  
  final String title;
  final String? brand;
  final String? className;
  const SeeAllPage({super.key, required this.title, this.brand, this.className});

  @override
  Widget build(BuildContext context) {
    //final apiService = CarApiClient(Dio(BaseOptions(contentType: 'application/json')));
    return StreamBuilder(
      stream: className != null ? CarViewModel().getCarsByClassStream(className!) : (brand != null ? CarViewModel().getCarsByBrandStream(brand!) : CarViewModel().getAllCarsStream()),
      builder: (context,snapshot) {
        if (snapshot.connectionState != ConnectionState.active) {
          return Container(
            color: const Color.fromRGBO(246, 246, 246, 1),
          );
        }
        
        final List<Car> cars = snapshot.data ?? [];
        return Scaffold(
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          appBar: AppBar(
                shadowColor: Color.fromRGBO(121, 121, 121, 0.1),
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
                centerTitle: true,
                
                leadingWidth: 70,
                toolbarHeight: 65,
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
              ),
        
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (cars.isEmpty) 
                        Text('No cars available',style: TextStyle(color: Colors.grey,))
                      else
                    ...cars.map((car){
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CarDetailPage(carId: car.carId))),
                            child: CarCard(className: car.className,name: '${car.brand} ${car.model}',rating: car.rating,price: car.price,transmissionType: car.transmissionType,fuelType: car.fuelType,seat: car.seat,image: car.images[0],)
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                      
                    SizedBox(height: 60)
                  ],),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}