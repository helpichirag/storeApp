import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator while waiting for data
          }

          if (snapshot.hasData && snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                print(userData['productimg']);
                print(userData['productid']);
                
                return ListTile(
                  title: Text(' ${userData['productname']}'),
                  leading:  Text(' ${userData['productid']}'),
                  subtitle: Text('${userData['productprice']}'),
                  trailing: Image.network('${userData['productimg']}',fit: BoxFit.cover,),
                );
              },
            );
          }

          return Text('No data available');
        },
      ),
    );
  }
}
