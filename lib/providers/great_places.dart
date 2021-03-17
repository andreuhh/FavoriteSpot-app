import 'package:flutter/foundation.dart'; // for use changeNotifier
import '../models/place.dart';

// ChangeNotifier è un mixin che permette di chiamare notifyListener
class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  // create a copy of items
  List<Place> get items {
    return [..._items];
  }
}
