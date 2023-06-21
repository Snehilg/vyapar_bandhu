import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/addItemScreen.dart';

class OwnerInventoryScreen extends StatefulWidget {
  const OwnerInventoryScreen({Key? key}) : super(key: key);
  static const String _title = 'Inventory';

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
  ];

  static const current_quantity = [40, 70, 60, 80, 90, 60, 21, 40, 50];
  static const min_quantity = [20, 20, 20, 20, 20, 20, 20, 20, 20];

  @override
  State<OwnerInventoryScreen> createState() => _OwnerInventoryScreenState();
}

class _OwnerInventoryScreenState extends State<OwnerInventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(OwnerInventoryScreen._title),
          backgroundColor: Colors.blue),
      body: SafeArea(
        child: ListView.builder(
          itemCount: OwnerInventoryScreen.items.length,
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
                              OwnerInventoryScreen.items[index],
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
                              'current quantity :${OwnerInventoryScreen.current_quantity[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          //minimum quantity
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text(
                              'minimum quantity ${OwnerInventoryScreen.min_quantity[index]}',
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
                        Icons.delete,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddItemScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
