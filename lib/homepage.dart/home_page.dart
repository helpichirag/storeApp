import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codstore/components/purchasedproduct/previsoulybuy.dart';
import 'package:codstore/homepage.dart/item_screen.dart';
import 'package:codstore/homepage.dart/viewscreen.dart';
import 'package:flutter/material.dart';
import '../components/bottom_navigationbar_homePpage.dart';
import '../components/home_screen_components.dart';
import '../components/singletextValue.dart';
import '../components/userreport.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 1;

  static TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];


 void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;

    });
  
  }





  


  // Future CreateUser({required String name,}) async {
  // //  Refference to our documents
  // final docuser= FirebaseFirestore.instance.collection('users').doc();
  // final user = User(
  //   id: docuser.id,
  //   name: name,
  //   age: 21,
  //  birthday: DateTime(2001, 7, 28)
  // );

  // // final json = {
  // //   'nmae': name,
  // //   "age": 21,
  // //   'birthday': DateTime(2001, 7, 28)
  // // };
  // final json = user.tojson();
  // await docuser.set(json);
  // }

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;
    return SafeArea(


      child: Scaffold(
        appBar: AppBar(

          // actions: [
          //   IconButton(onPressed: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context){
          //       // return ShowData();
          //       return ViewScreen();
          //     }));
          //   }, icon: Icon(Icons.share_rounded)),

            // IconButton(onPressed: (){
            //   final name = controllernmae.text;

            //   CreateUser(name:name);
            // }, icon: Icon(Icons.add))
          // ],
          backgroundColor: Colors.yellow.shade900,
          title:  Column(
              children: [
                Row(
                     children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: CircularAvtarUser(AssetImage("assets/user.jpg")),
                        ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical:14.0, horizontal: 10),
                         child: UserDetails(),
                       ),
                     ],
                   ),


                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: 
                         SearchProductTextField(height*0.05, width*0.7, controllernmae),
                         

                   ),


                   SizedBox(height: 20,)




              ]
            
          ),
          
        ),

         body: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
         
                    children: [
         
                       Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Text("My Wallet Balance", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.yellow.shade900),),
                              ),
                      



                       Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical:5),
                                child: Text("Rs. 2,500", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                    
         
                       Row(
                          children: [
                            Expanded(
                              child: UserWallet(height*0.1)
                            ),
                               
                            Expanded(
                              child:UserWalletStatement(height*0.1)
                            )
                          ],
                        ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:1),
                        child: Text("My Previous Oreder", style: TextStyle(color: Colors.yellow.shade900, fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          height:height*0.2,
                          width: double.infinity,
                           child:   StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('products').snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Show a loading indicator while waiting for data
                                    }
                        
                                    if (snapshot.hasData && snapshot.data != null) {
                                        return  ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemExtent:  100,
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                                              return Center(
                                                child: Container(
                                                      height: height*0.14,
                                                      width: width*0.2,
                                                      margin: EdgeInsets.all(10),
                                                      child: Column(
                                                        // title: Text(' ${userData['productname']}'),
                                                        // leading:  Text(' ${userData['productid']}'),
                                                        // subtitle: Text('${userData['productprice']}'),
                                                        // trailing: Image.network('${userData['productimg']}',fit: BoxFit.cover,),
                                              
                                              
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap:(){Navigator.push(context, 
                                                              MaterialPageRoute(builder: (context){
                                                                return ItemScreenWhichChoosed(
                                                                  productreview:'${userData['preview']}',
                                                                  productdesciption:'${userData['description']}',
                                                                  itemimg1: '${userData['productimg3']}',
                                                                  itemimg2: '${userData['productimg2']}',
                                                                  itemimg3: '${userData['productimg']}',
                                                                  itemName:'${userData['productname']}');
                                                                }));
                                                              
                                                              },
                                                              
                                                              child: CircleAvatar(
                                                                backgroundColor: Colors.transparent,
                                                                foregroundColor: Colors.grey.shade300,
                                                                radius: 110,
                                                                child: Container(
                                                                  height: height*2,
                                                                  width: width*1,
                                                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(width: 2, color: Colors.grey.shade200),
                                                                  borderRadius: BorderRadius.circular(100),
                                                                  image: DecorationImage(
                                                                    image: NetworkImage('${userData['productimg3']}'),
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                  // child: Image.network('${userData['productimg']}'),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text('${userData['productname']}'),
                                                        ],
                                                      ),
                                                    
                                                  
                                                ),
                                              );
                                            },
                                          
                                        );
                                        }
                        
                                        return Text('No data available');
                                      },
                                    ),
                            
                          
                        
                      ),
                      // -----------offrrs and deal
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical:1),
                        child: Text("My Offers & Deals", style: TextStyle(color: Colors.yellow.shade900, fontSize: 20.0, fontWeight: FontWeight.bold),),
                      ),
                      Container(
                          height:height*0.2,
                          width: double.infinity,
                           child:   StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('offersanddeals').snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return CircularProgressIndicator(); // Show a loading indicator while waiting for data
                                    }
                        
                                    if (snapshot.hasData && snapshot.data != null) {
                                        return  ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemExtent:  100,
                                            itemCount: snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              var userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;

                                              return Center(
                                                child: Container(
                                                      height: height*0.14,
                                                      width: width*0.2,
                                                      margin: EdgeInsets.all(10),
                                                      child: Column(
                                                        // title: Text(' ${userData['productname']}'),
                                                        // leading:  Text(' ${userData['productid']}'),
                                                        // subtitle: Text('${userData['productprice']}'),
                                                        // trailing: Image.network('${userData['productimg']}',fit: BoxFit.cover,),
                                              
                                              
                                                        children: [
                                                          Expanded(
                                                            child: CircleAvatar(
                                                              backgroundColor: Colors.transparent,
                                                              foregroundColor: Colors.grey.shade300,
                                                              radius: 110,
                                                              child: Container(
                                                                height: height*2,
                                                                width: width*1,
                                                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(width: 2, color: Colors.grey.shade200),
                                                                borderRadius: BorderRadius.circular(100),
                                                                image: DecorationImage(
                                                                  image: NetworkImage('${userData['dealimg']}'),
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                                // child: Image.network('${userData['productimg']}'),
                                                              ),
                                                            ),
                                                          ),
                                                          
                                                          Text(' ${userData['dealname']}'),
                                                        ],
                                                      ),
                                                    
                                                  
                                                ),
                                              );
                                            },
                                          
                                        );
                                        }
                        
                                        return Text('No data available');
                                      },
                                    ),
                            
                          
                        
                      )
                            

                            
                        




                     





                    ]

                  )
                ),


         ),
         
         
         
                
            
                    
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(78.0),
              child: SizedBox(
                height: height*0.13,
                child: BottomNavigationBar(
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  selectedLabelStyle: TextStyle(color: Colors.black),
                  unselectedLabelStyle: TextStyle(color: Colors.grey),

                backgroundColor: Colors.grey.shade200.withOpacity(0.9),
              
                items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings, color:Colors.amber),
                  activeIcon: Icon(Icons.settings, size: 46,),
                        
                  label: 'Settings',
                ),
                        
                 BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 40.0,
                    child: Icon(Icons.qr_code, size: 46,),
                  ),
                  activeIcon: CircleAvatar(
                    radius: 40.0,
                    child: Icon(Icons.qr_code, size: 56,),
                  ),
                  label: '',
                ),
                        
                        
                          
                BottomNavigationBarItem(
                  icon: Icon(Icons.sell, color:Colors.amber),
                  activeIcon: Icon(Icons.sell, size: 46,),
                        
                  label: 'Cart',
                ),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: onItemTapped,
                      
                    ),
              ),
            )
          ),
        )
        
    );


            
  }
}