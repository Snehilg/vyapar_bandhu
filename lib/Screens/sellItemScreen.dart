import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/addItemScreen.dart';

class SellItemScreen extends StatelessWidget {
  const SellItemScreen({Key? key}) : super(key: key);
  static const String _title = 'Sell Item';

  static const items = [
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
    'aashirvad Atta',
  ];

  static const current_quantity = [
    40,
    70,
    60,
    80,
    90,
    60,
    21,
    40,
    50,
    14,
    40,
    44
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title), backgroundColor: Colors.blue),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  //we have used flex in the column and icon as well to allot 3:1 space
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name of item
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              items[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          //current quantity of item
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'current quantity :${current_quantity[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.minimize,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      //floating action button
    );
  }
}
