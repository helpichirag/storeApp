import 'package:cloud_firestore/cloud_firestore.dart';

// Fetch data from Firestore
Future<void> fetchProducts() async {
  try {
    QuerySnapshot usersSnapshot =
        await FirebaseFirestore.instance.collection('products').get();

    usersSnapshot.docs.forEach((doc) {
      // Access the document data
      var userData = doc.data();
      print(userData);
    });
  } catch (e) {
    print('Error getting users: $e');
  }
}
