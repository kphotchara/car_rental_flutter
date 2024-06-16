import 'package:car_rental_flutter/Model/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarViewModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<Car?> getCarByIdStream(String carId) {
    return firestore
        .collection('cars')
        .doc(carId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? Car.fromSnapshot(snapshot) : null);
  }
  
  Stream<List<Car>> getAllCarsStream() {
    return firestore
        .collection('cars')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Car.fromSnapshot(doc)).toList());
  }

  Stream<List<Car>> getCarsByClassStream(String carClass) {
    return firestore
        .collection('cars')
        .where('class', isEqualTo: carClass)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Car.fromSnapshot(doc)).toList());
  }

  Stream<List<Car>> getCarsByBrandStream(String brand) {
    return firestore
        .collection('cars')
        .where('brand', isEqualTo: brand)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Car.fromSnapshot(doc)).toList());
  }
  
}