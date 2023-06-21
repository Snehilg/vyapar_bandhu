import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellItemScreen extends StatefulWidget {
  const SellItemScreen({Key? key}) : super(key: key);
  static const String _title = 'Sell item';

  @override
  State<SellItemScreen> createState() => _SellItemScreenState();
}

class _SellItemScreenState extends State<SellItemScreen> {
  final String ownerEmail = "";

  //stream of items in owners through email of owner from worker
  Stream<QuerySnapshot> itemsStream = FirebaseFirestore.instance
      .collection('owners')
      .doc('snehilgcoc@gmail.com')
      .collection('items')
      .snapshots();

  //item ref
  CollectionReference itemsRef = FirebaseFirestore.instance
      .collection('owners')
      .doc('snehilgcoc@gmail.com')
      .collection('items');

  //function that will be called by minus icon
  void updateCount(String count, String uid) {
    int currentQuantity = int.parse(count);
    if (currentQuantity > 0) {
      currentQuantity--;
      itemsRef
          .doc(uid)
          .update({'currentQuantity': currentQuantity.toString()})
          .then((value) => print('updated $uid with $currentQuantity'))
          .catchError((Error) => print('error occured in updating $uid'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(SellItemScreen._title),
          backgroundColor: Colors.blue),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: itemsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
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
                              Icons.minimize,
                              color: Colors.white,
                            ),
                            //for updating the fxn called with curr quant and uid
                            onPressed: () => updateCount(
                                snapshot.data!.docs[index]
                                    .get('currentQuantity'),
                                snapshot.data!.docs[index].get('uid')),
                          ),
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
    );
  }
}

/*ListView.builder(
          itemCount: SellItemScreen.items.length,
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
                              SellItemScreen.items[index],
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
                              'current quantity :${SellItemScreen.current_quantity[index]}',
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
        ),*/
