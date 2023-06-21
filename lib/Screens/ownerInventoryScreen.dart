import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_bandhu/Screens/addItemScreen.dart';

class OwnerInventoryScreen extends StatefulWidget {
  const OwnerInventoryScreen({Key? key}) : super(key: key);
  static const String _title = 'Inventory';

  @override
  State<OwnerInventoryScreen> createState() => _OwnerInventoryScreenState();
}

class _OwnerInventoryScreenState extends State<OwnerInventoryScreen> {
  //stream for item collection owners->email->Collection('items')->docs

  final Stream<QuerySnapshot> itemsStream = FirebaseFirestore.instance
      .collection('owners')
      .doc(FirebaseAuth.instance.currentUser!.email!)
      .collection('items')
      .snapshots();

  //collection ref for items
  CollectionReference itemsRef = FirebaseFirestore.instance
      .collection('owners')
      .doc(FirebaseAuth.instance.currentUser!.email!)
      .collection('items');

  void deleteItem(String uid) {
    itemsRef
        .doc(uid)
        .delete()
        .then((value) => print("deleted doc $uid"))
        .catchError((Error) => print('error occured in deleteing $uid'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: Text(OwnerInventoryScreen._title),
          backgroundColor: Colors.blue),*/
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: itemsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      //which color to show based on quantity
                      color: (int.parse(
                                  '${snapshot.data!.docs[index].get('currentQuantity')}') >
                              int.parse(
                                  '${snapshot.data!.docs[index].get('minQuantity')}'))
                          ? Colors.blue
                          : Colors.red,
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
                                  snapshot.data!.docs[index].get('name'),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              //current quantity of item
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  'current quantity :${snapshot.data!.docs[index].get('currentQuantity')}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                              //minimum quantity
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                child: Text(
                                  'minimum quantity ${snapshot.data!.docs[index].get('minQuantity')}',
                                  style: const TextStyle(
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
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            iconSize: 50,
                            onPressed: () => deleteItem(
                                snapshot.data!.docs[index].get('uid')),
                          ),
                          /*,Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),*/
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      //floating action button -> add item screen
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
/*ListView.builder(
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
                              style: const TextStyle(
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
        ),*/
