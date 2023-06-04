import 'package:flutter/material.dart';


Widget PrevisoulyProduct(AssetImage productimgPath){



  return CircleAvatar(
                                  radius: 50.0, // Adjust the radius as needed
                                  backgroundImage:productimgPath, // Replace with your image path
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