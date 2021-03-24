import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locaData = await Location().getLocation();
    print(locaData.latitude);
    print(locaData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              label: Text('Current Location'),
              textColor: Theme.of(context).accentColor,
              onPressed: _getCurrentUserLocation,
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.map,
                color: Theme.of(context).primaryColor,
              ),
              label: Text('Select on map'),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
