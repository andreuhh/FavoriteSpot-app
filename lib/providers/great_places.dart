import 'dart:io';
import 'package:flutter/foundation.dart'; // for use changeNotifier
import '../models/place.dart';
import '../helpers/db_helper.dart';

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
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }
}
