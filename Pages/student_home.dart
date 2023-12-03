import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/cart_page.dart';
import 'package:project/widgets/cart.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatelessWidget {
  StudentHome({Key? key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home Page'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];
                String? imageUrl = data['image_url']; // Change to String?

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(noteText),
                    subtitle: Text(
                      'Price: Rs ${data['price'].toString()}',
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading: imageUrl != null
                        ? Image.network(
                            imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Add the selected item to the cart
                        cart.addItem(
                          CartItem(
                            itemName: noteText,
                            price: data['price'],
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to Cart: $noteText'),
                          ),
                        );
                      },
                      child: Text('Add to Cart'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the CartPage when the FAB is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage(cart: cart)),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
