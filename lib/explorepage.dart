import 'package:car_rental_flutter/Components/brandItem.dart';
import 'package:car_rental_flutter/Components/car_card.dart';
import 'package:car_rental_flutter/Components/classItem.dart';
import 'package:flutter/material.dart';

class Explorepage extends StatefulWidget {
  @override
  _ExplorepageState createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  // Controller for the search field
  TextEditingController searchController = TextEditingController();

  static const IconData search_outlined = IconData(0xf34b, fontFamily: 'MaterialIcons');

  // Function to filter items based on user input
  void filterSearchResults(String query) {
    // Perform filtering logic here
    print(query); // Example: Printing query
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 345, // Width of the search bar
                height: 50, // Height of the search bar
                margin: EdgeInsets.only(top: 20, left: 10), // Positioning
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Optional border
                  borderRadius: BorderRadius.circular(8), // Optional border radius
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          filterSearchResults(value);
                        },
                        decoration: InputDecoration(
                          icon: Icon(Icons.search_outlined),
                          hintText: 'Search...',
                          contentPadding: EdgeInsets.symmetric(horizontal: 2),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.filter_list),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Brands', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          BrandItem('Tata', Icons.directions_car),
                          BrandItem('Volkswagen', Icons.directions_car),
                          BrandItem('Jeep', Icons.directions_car),
                          BrandItem('Honda', Icons.directions_car),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Class', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ClassItem('Hatchback', Icons.directions_car),
                          ClassItem('SUV', Icons.directions_car),
                          ClassItem('Sedan', Icons.directions_car),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Popular Car', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    CarCard(
                      rating: 5,
                      image: 'lib/images/CarRent1.jpg',
                      name: 'Grey Audi R8',
                      className: 'SUV',
                      price: 3200 ,
                      transmissionType: 'ppp',
                      fuelType: 'fuelType',
                      seat: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}