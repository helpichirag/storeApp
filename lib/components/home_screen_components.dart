

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget CircularAvtarUser(AssetImage imgPath){
  return  CircleAvatar(
                  radius: 50.0, // Adjust the radius as needed
                  backgroundImage:imgPath, // Replace with your image path
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),
  );

}

//  user detailss

Widget UserDetails(){

  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
            children: [
              Text("Emma Watson", style: TextStyle(fontSize: 19)),
              Text("chiragroy3030@gmail.com", style: TextStyle(fontSize: 14),),
              Text("91+ 62079XXXX" ,style: TextStyle(fontSize: 14)),
  
            ],
        
                          
          
    ),
  );
}


/// search product textfield
/// \
/// 
/// 


final TextEditingController controllernmae=  TextEditingController();

Widget SearchProductTextField(double height, double width, controller){
print(controllernmae);


  void searchProducts(String controllernmae) {
  FirebaseFirestore.instance
      .collectionGroup('products')
      .where('productname', isEqualTo: controllernmae)
      .get()
      .then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((DocumentSnapshot document) {
      // Handle the retrieved document(s) here
      print(document.data());
    });
  });
}
  return Padding(
    padding: const EdgeInsets.only(top:8.0),
    child: Container(
                      width:width*5,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.0),
                        color: Colors.white
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(top:10, left: 20, right: 10),
                          child: TextField(
                            
                            onSubmitted: (value) =>
                            searchProducts,
                            
                            controller: controllernmae,
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(Icons.search, size:35),
                              hintText: "Search Your Product"
                                           
                              
                            ),
                           ),
                        ),
                      
                     ),
  );
}