/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> orders = snapshot.data!.docs;

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> orderData =
                    orders[index].data() as Map<String, dynamic>;

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Order ID: ${orderData['orderId']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Items:'),
                        for (var item in orderData['items'])
                          ListTile(
                            title: Text(item['itemName']),
                            subtitle: Text('Quantity: ${item['quantity']}'),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> orders = snapshot.data!.docs;

            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> orderData =
                    orders[index].data() as Map<String, dynamic>;

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text('Order ID: ${orderData['orderId']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Timestamp: ${orderData['timestamp'].toDate()}'),
                        SizedBox(height: 8),
                        Text('Items:'),
                        for (var item in orderData['items'])
                          ListTile(
                            title: Text(item['itemName']),
                            subtitle: Text(
                              'Price: \$${item['price'].toStringAsFixed(2)} | Quantity: ${item['quantity']} | Delivered: ${item['delivered'] ? 'Yes' : 'No'}',
                            ),
                            trailing: Container(
                              color: item['delivered']
                                  ? Colors.green[
                                      300] // Set background color to green if delivered
                                  : Colors.blue[
                                      300], // Set background color to blue if not delivered
                              child: ElevatedButton(
                                onPressed: () {
                                  // Toggle delivered status when the button is pressed
                                  markAsDelivered(
                                    orderData['orderId'],
                                    item['itemName'],
                                    !item['delivered'],
                                  );
                                },
                                child: Text(
                                  item['delivered']
                                      ? 'Undo Delivered'
                                      : 'Mark Delivered',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void markAsDelivered(String orderId, String itemName, bool delivered) {
    FirebaseFirestore.instance
        .collection('Orders')
        .where('orderId', isEqualTo: orderId)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((DocumentSnapshot document) {
        // Get the document reference
        DocumentReference docRef = document.reference;

        // Update the items array to mark the specific item as delivered
        List<dynamic> items = document['items'] ?? [];
        List<Map<String, dynamic>> updatedItems =
            List<Map<String, dynamic>>.from(items);

        for (int i = 0; i < updatedItems.length; i++) {
          if (updatedItems[i]['itemName'] == itemName) {
            updatedItems[i]['delivered'] = delivered;
            break;
          }
        }

        // Update the document with the modified items array
        docRef.update({'items': updatedItems});
      });
    }).catchError((error) {
      print("Error getting documents: $error");
    });
  }
}
