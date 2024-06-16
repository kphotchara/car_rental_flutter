import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Car {
  String carId;
  String className;
  String brand;
  String model;
  double price;
  String transmissionType;
  String fuelType;
  int seat;
  List<String> images;
  double rating;

  Car({
    required this.carId,
    required this.className,
    required this.brand,
    required this.model,
    required this.price,
    required this.transmissionType,
    required this.fuelType,
    required this.seat,
    required this.images,
    required this.rating,
  });
factory Car.fromSnapshot(DocumentSnapshot snapshot) {
  final data = snapshot.data() as Map<String, dynamic>;
  //print(data);
  return Car(
    carId: snapshot.id,
    brand: data['brand'] as String,
    model: data['model'] as String,
    price: (data['price'] as num).toDouble(),
    className: data['class'] as String,
    transmissionType: data['transmissionType'] as String,
    fuelType: data['fuelType'] as String,
    seat: (data['seat'] as num).toInt(),
    images: (data['image'] as List<dynamic>).map((e) => e.toString()).toList(),
    rating: (data['rating'] as num).toDouble(),
  );
}

  
  factory Car.fromJson(Map<String, dynamic> json) {
    //print(json);
    return Car(
      carId: json['name'].toString().split('/').last,
      brand: json['fields']['brand']['stringValue'],
      model: json['fields']['model']['stringValue'],
      price: json['fields']['price']['doubleValue'] ?? int.parse(json['fields']['price']['integerValue']).toDouble(),
      className: json['fields']['class']['stringValue'],
      transmissionType: json['fields']['transmissionType']['stringValue'],
      fuelType: json['fields']['fuelType']['stringValue'],
      seat: int.parse(json['fields']['seat']['integerValue']),
      images: (json['fields']['image']['arrayValue']['values'] as List<dynamic>)
          .map((value) => value['stringValue'] as String)
          .toList(),
      rating: json['fields']['rating']['doubleValue'],
    );
  }

  // @override
  // String toString() {
  //   return 'Car: $brand $model,Price: $price';
  // }
}

class CarList {
  List<Car> carList;
  CarList({required this.carList});
  factory CarList.fromSnapshot(QuerySnapshot snapshot) {
    return CarList(
      carList: snapshot.docs.map((doc) => Car.fromSnapshot(doc)).toList(),
    );
  }
  factory CarList.fromJson(Map<String, dynamic> json) {
    //print(json);
    return CarList(
      carList: (json['documents'] as List<dynamic>)
          .map((value) => Car.fromJson(value as Map<String, dynamic>))
          .toList(),
          
    );
  }
}


