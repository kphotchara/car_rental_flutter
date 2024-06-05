import 'package:flutter/material.dart';
import 'curved_edges_widget.dart';

class CarDetailPage extends StatelessWidget {
  const CarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 203, 152, 152),
      body: SingleChildScrollView(

        child: Column(
          children: [
            CurvedEdgesWidget(child: Container(
                color: Color.fromRGBO(246, 246, 246, 1),
                //height: 300,
                child: Stack(
                  children: [
                      /////// image section 
                      Padding(
                        padding: EdgeInsets.only(top: 120,bottom: 30),
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
            ),),
            
        
            ///////////////////
            
        
          ],
        ),
      ),
    );
  }
}