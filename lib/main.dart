import 'dart:io';

import 'package:flutter/material.dart';
import 'homepage.dart/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity/connectivity.dart';


void main() async  {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    bool isConnected = await checkInternetConnection();

      if (isConnected) {

        runApp(MyApp());
      } else {
        Center(child: Container(color: Colors.red,child: Text("Offline", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),));
      }
}


// check connnection here first
Future<bool> checkInternetConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CodeMate.ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow.shade800),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
        toolbarHeight:  MediaQuery.of(context).size.height*0.2
    ),
      
      ),

      
      home: HomePage(),
    );
  }
}
