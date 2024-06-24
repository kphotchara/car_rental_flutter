import 'package:car_rental_flutter/Components/about_chip.dart';
import 'package:car_rental_flutter/Components/app_bar_detail_book.dart';
import 'package:car_rental_flutter/Model/car.dart';
import 'package:car_rental_flutter/View/book_page.dart';
//import 'package:car_rental_flutter/ViewModel/car_retrofit.dart';
import 'package:car_rental_flutter/homepage.dart';
import 'package:car_rental_flutter/ViewModel/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CarDetailPage extends StatelessWidget {
  
  final String carId;
  const CarDetailPage({super.key, required this.carId});
  
  @override
  Widget build(BuildContext context) {
    //final apiService = CarApiClient(Dio(BaseOptions(contentType: 'application/json')));
    return StreamBuilder(
      stream: CarViewModel().getCarByIdStream(carId),
      builder: (context, snapshot){
        if (snapshot.hasData == false){
          //print(snapshot.data);
          return Container(
            color: const Color.fromRGBO(246, 246, 246, 1),
          );
        }
        final car = snapshot.data;
        //print(car);
        return Scaffold(
          appBar: const AppBarDetailBook(title: "Car Detail"),
          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
          body: DetailBody(car: car!,),
          bottomNavigationBar: Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                color: Color.fromRGBO(246, 246 , 246, 1),
                spreadRadius: 4,
                blurRadius: 0,
                offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price",style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 14,fontWeight: FontWeight.w600),),
                      Text("\$${car.price}  " ,style: TextStyle(color: Color.fromRGBO(0, 125, 252, 1),fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => BookPage(car: car)),);
                    },
                    child: Text('Book Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(Size(220, 50)),
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                    ),
                  ),
              
              ],),
            ),
          ),
        );
      }
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({
    super.key,
    required this.car,
  });
  final Car car;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
              color: Color.fromRGBO(246, 246, 246, 1),
              //height: 300,
              child: Stack(
                children: [
                    /////// image section 
                    Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 20),
                      child: Column(
                        children: [
                          Center(
                            child: Image.network(car.images[0],width: 200,)
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                            child: Container(
                              width: 300,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(5 , (index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color.fromRGBO(246, 246, 246, 1),
                                    ),
                                    width: 50,
                                    height: 50,
                                    child: Image.network('https://th.bing.com/th/id/R.8b01377204f7e5e60f3928fa9c6d8d8d?rik=veNTNapnhdPf5A&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-hd-images-of-cars-volkswagen-png-hd-1500.png&ehk=bzMQ1ueAXMsJzhilqNehN77R9uwSPUm8hoyg%2bCU3wYo%3d&risl=&pid=ImgRaw&r=0'),
                                  );
                                }),
                              ),
                            ),
                          )
                        ],
                      )
                    ),
          
                    
                    
                    
                ],
              ),
          ),
          
      
          /////////////////////
          ///details section///
          /////////////////////
          
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16,left: 24,right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                /////// - class rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(246, 246, 246, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2,bottom: 2,left: 8,right: 8),
                        child: Text(
                              car.className,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange,size: 25,),
                        Text(
                          car.rating.toString(),
                          style: const TextStyle(
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
                  car.brand + " " + car.model,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                /////// - plate/id
                const SizedBox(height: 8.0),
                
                Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(246, 246, 246, 1),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.only(top: 2,bottom: 2,left: 8,right: 8),
                        child: Text(
                              'DL01KN7534',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                
                const SizedBox(height: 8.0),
                
                const Divider(
                  color: Color.fromRGBO(121, 121, 121, 0.5),
                  thickness: 1,
                ),
                /////// - about
                const SizedBox(height: 8.0),
                
                const Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutChip(text: 'Great',icon: Icons.check_circle,),
                        const SizedBox(height: 8.0),
                        AboutChip(text: car.transmissionType,icon: Icons.settings,),
                      ],
                    
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutChip(text: '2021',icon: Icons.calendar_today,),
                        const SizedBox(height: 8.0),
                        AboutChip(text: car.fuelType,icon: Icons.local_gas_station,),
                      ],
                    
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AboutChip(text: '3500'+" Km",icon: Icons.speed,),
                        const SizedBox(height: 8.0),
                        AboutChip(text: "${car.seat} Seats",icon: Icons.people,),
                      ],
                    
                    ),
                
                  ]
                
                ),
                
                
                
                /////// - Owner
                const SizedBox(height: 16.0),
                
                Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromRGBO(246, 246, 246, 1),
                          child: Icon(Icons.person_3,color: Color.fromRGBO(0, 125, 252, 1),),
                        ),
                        const SizedBox(width: 8.0),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pinkie Pie',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                            Text('Owner',style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 12),),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.message,
                            color: Color.fromRGBO(0, 125, 252, 1),
                          ),
                          style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(const Size(35, 35)),
                                backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(246, 246, 246, 1)),
                                iconSize: WidgetStateProperty.all(20),
                                shape: WidgetStateProperty.all(const CircleBorder()),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.call,
                            color: Color.fromRGBO(0, 125, 252, 1),
                          ),
                          style: ButtonStyle(
                                fixedSize: WidgetStateProperty.all(const Size(35, 35)),
                                backgroundColor: WidgetStateProperty.all(const Color.fromRGBO(246, 246, 246, 1)),
                                iconSize: WidgetStateProperty.all(20),
                                shape: WidgetStateProperty.all(const CircleBorder()),
                          ),
                          onPressed: () async{
                            print("ff");
                            if(await canLaunchUrl(Uri(scheme: 'tel', path: '1234567890'))){
                              launchUrl(Uri(scheme: 'tel', path: '1234567890'));
                            }
                        
                          },
                        ),
                      ],
                    ),
                
                const SizedBox(height: 8.0),
                
                const Divider(
                  color: Color.fromRGBO(121, 121, 121, 0.5),
                  thickness: 1,
                ),
                
                
                /////// - review
                const SizedBox(height: 8.0),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8.0),
                ReviewRow(rating: 4.5,name: 'rainbow dash',date: DateTime(2023,12,31),),
                const SizedBox(height: 8.0),
                ReviewRow(rating: 4.3,name: 'John Doe',date: DateTime(2012,10,11),),
                const SizedBox(height: 8.0),
                ReviewRow(rating: 3.7,name: 'Jane Doe',date: DateTime(2019,11,21),),
                const SizedBox(height: 8.0),
                ReviewRow(rating: 4.9,name: 'Juliet Doe',date: DateTime(2019,11,21),),
                const SizedBox(height: 8.0),
                const SizedBox(height: 24.0),
                
              ],),
            ),
          )
      
        ],
      ),
    );
  }
}

class ReviewRow extends StatelessWidget {
  const ReviewRow({
    super.key,
    required this.rating,
    required this.name,
    required this.date,
  });
  final double rating;
  final String name;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color.fromRGBO(246, 246, 246, 1),
              child: Icon(Icons.person_3,color: Color.fromRGBO(0, 125, 252, 1),),
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange,size: 20,),
                    Text(rating.toString(),style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 12),),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(differenceInMonths(date, DateTime.now()).toString()+" months ago",style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 12),),
          ],
        );
  }
  int differenceInMonths(DateTime startDate, DateTime endDate) {
    int yearsDiff = endDate.year - startDate.year;
    int monthsDiff = endDate.month - startDate.month;
    return yearsDiff * 12 + monthsDiff;
  }
}
