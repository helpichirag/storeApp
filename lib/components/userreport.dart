import 'package:flutter/material.dart';


Widget UserWallet(double height){
        return Container(
                            height: height,
                             margin: EdgeInsets.all(10.0),
                           decoration: BoxDecoration(

                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(28.0)
                           ),
                            child: Center(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: Container(
                                     decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Icon(Icons.add, size:30, color: Colors.yellow.shade900,))),
                                subtitle: Text("Add Money \nto wallet"),
                              ),
                            ),
                          );


}


// user wallet statement


Widget UserWalletStatement(double height){

  return  Container(
                           height: height,
                           margin: EdgeInsets.all(10.0),
                           decoration: BoxDecoration(

                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(28.0)
                           ),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                     
                                     decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),),
                                  
                                  child: Icon(Icons.receipt,size:30, color: Colors.yellow.shade900,)),
                                subtitle: Text("My Wallet \nStatement"),
                              
                              ),
                            ),
                          );
}