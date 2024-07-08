import 'dart:ui';

import 'package:car_rental_flutter/Components/about_chip.dart';
import 'package:car_rental_flutter/Components/app_bar_detail_book.dart';
import 'package:car_rental_flutter/Model/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key,
  required this.car,
  });
  final Car car;

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  
  int rentType = 0;
  DateTime selectedPickUpDate = DateTime.now();
  
  DateTime selectedDropOffDate = DateTime.now();
  
  String? selectedPickUpLocation;
  String? selectedDropOffLocation;

  List<String> locations = ['Trang Night Market', 'Trang National Museum', 'Chang Lang Beach', 'Wat Tantayaphirom Temple', 'Trang Airport'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDetailBook(title: "Book Car"),
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print(rentType == 0 ? "Self-Drive" : "With Driver");
                      print("${selectedPickUpLocation??"select Location"} $selectedPickUpDate");
                      print("${selectedDropOffLocation??"select Location"} $selectedDropOffDate");
                    },
                    child: Text('Continue',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(Size(340, 50)),
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                    ),
                  )
              
              ],),
            ),
          ),
      body: SingleChildScrollView(
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
                      padding: EdgeInsets.only(top: 0,bottom: 20),
                      child: Column(
                        children: [
                          Center(
                            child: Image.network(widget.car.images[0],width: 200,)
                          ),
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
                              widget.car.className,
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
                          widget.car.rating.toString(),
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
                  widget.car.brand + " " + widget.car.model,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                
                const SizedBox(height: 8.0),
                
                const Divider(
                  color: Color.fromRGBO(121, 121, 121, 0.5),
                  thickness: 1,
                ),
                /////// - about
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AboutChip(text: widget.car.transmissionType,icon: Icons.settings,),
                    AboutChip(text: widget.car.fuelType,icon: Icons.local_gas_station,),
                    AboutChip(text: "${widget.car.seat} Seats",icon: Icons.people,),
                
                  ]
                
                ),

                /////// - Rent type selection
                const SizedBox(height: 16.0),
                const Text(
                  "Rent Type",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        child: TextButton(
                          
                          style: ButtonStyle(
                          //fixedSize: WidgetStateProperty.all(Size(160, 50)),
                          foregroundColor: WidgetStateProperty.all(rentType==1 ? Color.fromRGBO(0, 125, 252, 1) : Color.fromRGBO(246, 246, 246, 1)),
                          backgroundColor: WidgetStateProperty.all(rentType==0 ? Color.fromRGBO(0, 125, 252, 1) : Color.fromRGBO(246, 246, 246, 1)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                        ),
                          onPressed: (){
                            setState (() {
                              rentType = 0;
                              //print(rentType);
                            });
                          }, 
                          child: Text("Self-Drive",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
                      ),
                    ),
                  SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          height: 50,
                          child: TextButton(
                          style: ButtonStyle(
                          //fixedSize: WidgetStateProperty.all(Size(160, 50)),
                          foregroundColor: WidgetStateProperty.all(rentType==0 ? Color.fromRGBO(0, 125, 252, 1) : Color.fromRGBO(246, 246, 246, 1)),
                          backgroundColor: WidgetStateProperty.all(rentType==1 ? Color.fromRGBO(0, 125, 252, 1) : Color.fromRGBO(246, 246, 246, 1)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                                              ),
                          onPressed: (){
                            setState (() {
                              rentType = 1;
                              //print(rentType);
                            });
                          }, 
                          child: Text("With Driver",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),
                        ),
                      )
                ],),

                const SizedBox(height: 16.0),
                Container(
                  
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 125, 252, 1),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: const Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromRGBO(246, 246, 246, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
                    child: Row(
                      children: [
                        Text("Additional ₹25/hr Driver Cost If You Choose \nWith Driver Option.",style: TextStyle(fontSize: 14),)
                      ],
                    ),
                  ),
                ),


                /////// - Rent Duration,place
                
                const SizedBox(height: 16.0),
                const Text(
                  "Pick-Up Location, Date & Time",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                LocationPicker(true),
                SizedBox(height: 16),
                DateTimePicker(true),
                ///////////
                
                const SizedBox(height: 16.0),
                const Text(
                  "Drop-Off Location, Date & Time",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                LocationPicker(false),
                SizedBox(height: 16),
                DateTimePicker(false),

                

                ///////
                SizedBox(height: 32),
                
              ],),
            ),
          ),
         
        ],
      ),
    ),
    );
  }

  Row DateTimePicker(bool isPickUp) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Color.fromRGBO(0, 125, 252, 1),
                                  outlineVariant: Color.fromRGBO(0, 125, 252, 1),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context, 
                          firstDate: isPickUp?DateTime.now():selectedPickUpDate, 
                          lastDate: DateTime(DateTime.now().year+1)).then((onValue){
                          setState(() {
                            if (onValue != null){
                              if (isPickUp){
                                selectedPickUpDate = DateTime(onValue.year, onValue.month, onValue.day, selectedPickUpDate.hour, selectedPickUpDate.minute);
                                //print(selectedPickUpDate);
                              }
                              else{
                                selectedPickUpDate = DateTime(onValue.year, onValue.month, onValue.day, selectedPickUpDate.hour, selectedPickUpDate.minute);
                              }
                            }
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromRGBO(246, 246, 246, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Date",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(121, 121, 121, 1)),),
                                  Text(DateFormat('EEE, dd MMM').format(isPickUp?selectedPickUpDate:selectedDropOffDate),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              Icon(Icons.calendar_month,color: Color.fromRGBO(0, 125, 252, 1),size: 25,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showTimePicker(
                          builder: (context, child) {
                            return MediaQuery(
                              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                              child: Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Color.fromRGBO(0, 125, 252, 1),
                                  secondary: Color.fromRGBO(0, 125, 252, 1),
                                ),
                              ),
                              child: child!,
                            ),
                            );
                          },
                          context: context, 
                          initialTime: TimeOfDay.now()).then((onValue){
                          setState(() {
                            if (onValue != null){
                              if (isPickUp){
                                selectedPickUpDate = DateTime(selectedPickUpDate.year, selectedPickUpDate.month, selectedPickUpDate.day, onValue.hour, onValue.minute);
                              }
                              else{
                                selectedDropOffDate = DateTime(selectedDropOffDate.year, selectedDropOffDate.month, selectedDropOffDate.day, onValue.hour, onValue.minute);
                              }
                            }
                          });
                        });
                      },
                      child: Container(
                        
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromRGBO(246, 246, 246, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Time",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(121, 121, 121, 1)),),
                                  Text(DateFormat('hh:mm a').format(isPickUp?selectedPickUpDate:selectedDropOffDate),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                                ],
                              ),
                              Icon(Icons.schedule,color: Color.fromRGBO(0, 125, 252, 1),size: 25,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
  }

  Container LocationPicker(bool isPickUpLocation) {
    return Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(246, 246, 246, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16),
                  child: DropdownButton<String>(
                    menuMaxHeight: 300,
                    style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),
                    dropdownColor: Color.fromRGBO(246, 246, 246, 1),
                    elevation: 1,
                    borderRadius: BorderRadius.circular(6),
                    isExpanded: true,
                    underline: Container(),
                    icon: Icon(Icons.location_on,color: Color.fromRGBO(0, 125, 252, 1),),
                            hint: Text('Select Location'),
                            value: isPickUpLocation ? selectedPickUpLocation : selectedDropOffLocation,
                            onChanged: (String? newValue) {
                              setState(() {
                                if (isPickUpLocation){
                                  selectedPickUpLocation = newValue;
                                }
                                else{
                                  selectedDropOffLocation = newValue;
                                }
                                //print(selectedPickUpLocation);
                              });
                            },
                            items: locations.map((String location) {
                              return DropdownMenuItem<String>(
                                value: location,
                                child: Text(location),
                              );
                            }).toList(),
                          ),
                ),
              );
  }

  
}
