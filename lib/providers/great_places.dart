import 'dart:io';
import 'package:flutter/foundation.dart'; // for use changeNotifier
import '../models/place.dart';

// ChangeNotifier è un mixin che permette di chiamare notifyListener
class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  // create a copy of items
  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
