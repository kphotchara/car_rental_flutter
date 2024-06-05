import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'curved_edges_widget.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("cars").doc("Bequ6sftTOGekcbc71jT").snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final car = snapshot.data!.data() as Map<String, dynamic>;

          return DetaiPage(name: car['model'],);
        }
        )
        ,
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
            color: Color.fromRGBO(246, 246 , 246, 1),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price",style: TextStyle(color: Color.fromRGBO(121, 121, 121, 1),fontSize: 14,fontWeight: FontWeight.w600),),
                  Text("\$ 5000",style: TextStyle(color: Color.fromRGBO(0, 125, 252, 1),fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              ElevatedButton(
                onPressed: () {},
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
}

class DetaiPage extends StatelessWidget {
  const DetaiPage({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
    
      child: Column(
        children: [
          CurvedEdgesWidget(
            child: Container(
                color: Color.fromRGBO(246, 246, 246, 1),
                //height: 300,
                child: Stack(
                  children: [
                      /////// image section 
                      Padding(
                        padding: EdgeInsets.only(top: 120,bottom: 32),
                        child: Column(
                          children: [
                            Center(
                              child: Image.network('https://th.bing.com/th/id/R.8b01377204f7e5e60f3928fa9c6d8d8d?rik=veNTNapnhdPf5A&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-hd-images-of-cars-volkswagen-png-hd-1500.png&ehk=bzMQ1ueAXMsJzhilqNehN77R9uwSPUm8hoyg%2bCU3wYo%3d&risl=&pid=ImgRaw&r=0',width: 200,)
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
                                  children: List.generate(5, (index) {
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
            
                      /////// app Bar section
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0,right: 14.0,bottom: 14.0),
                        child: AppBar(
                          surfaceTintColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          title: const Text('Car Details',style: TextStyle(fontWeight: FontWeight.bold),),
                          centerTitle: true,
                          leadingWidth: 45,
                          leading: IconButton(
                            style: ButtonStyle(
                              fixedSize: WidgetStateProperty.all(const Size(45, 45)),
                              backgroundColor: WidgetStateProperty.all(Colors.white),
                              iconSize: WidgetStateProperty.all(20),
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
                          ],
                        )
                      ),
                      
                  ],
                ),
            ),
          ),
          
      
          /////////////////////
          ///details section///
          /////////////////////
          
          Padding(
            padding: EdgeInsets.only(top: 0,left: 24,right: 24),
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
                name,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutChip(text: 'Great',icon: Icons.check_circle,),
                      const SizedBox(height: 8.0),
                      AboutChip(text: 'Manual',icon: Icons.settings,),
                    ],
                  
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutChip(text: '2021',icon: Icons.calendar_today,),
                      const SizedBox(height: 8.0),
                      AboutChip(text: 'Petrol',icon: Icons.local_gas_station,),
                    ],
                  
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutChip(text: '3500'+"Km",icon: Icons.speed,),
                      const SizedBox(height: 8.0),
                      AboutChip(text: '5 Seats',icon: Icons.people,),
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
                        onPressed: () {},
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
              const SizedBox(height: 32.0),
              
            ],),
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