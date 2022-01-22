import 'package:flutter/material.dart';
import 'package:location_algorithm/components/locations_dropdown';
import 'package:location_algorithm/services/places_service.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String dropdownValue = 'What do you want?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lime[50],
        appBar: AppBar(
            title: Text(
              'Area Location',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.greenAccent),
        body: Container(decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/location.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Container(
                  child: Text(
                      'New to your City?\nDo you seek for help?\nWe got you 😊\njust a click!',
                      style: TextStyle(
                        fontFamily: 'Satisfy',
                        fontSize: 22.0,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 60.0, right: 60.0, top: 10.0, bottom: 15.0),
                child: DropDownStrip(
                  dropdownitem: dropdownValue,
                  onChange: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      var details = {
                        'one': 'What do you want',
                        'two': 'ATM',
                        'three': 'Bank',
                      };
                      PlacesService.place = details[newValue];
                    });
                  },
                  item: [
                    'What do you want?',
                    'ATM',
                    'Bank',
                  ],
                ),
              ),
              ElevatedButton(
                child: Text(
                  'Locate',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/locate');
                },
              ),
            
            ],
          ),
        ));
  }
}
