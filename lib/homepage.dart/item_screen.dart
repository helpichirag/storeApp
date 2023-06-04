import 'package:codstore/homepage.dart/supplyscreen.dart';
import 'package:flutter/material.dart';
class ItemScreenWhichChoosed extends StatefulWidget {
  
  final String itemName;
  final String itemimg1;
  final String itemimg2;
  final String itemimg3;
  final String productdesciption;
  final String productreview;

  ItemScreenWhichChoosed({super.key, required this.itemName, required this.itemimg1, required this.itemimg2, required this.itemimg3, required this.productdesciption, required this.productreview});

  @override
  State<ItemScreenWhichChoosed> createState() => _ItemScreenWhichChoosedState();
}

class _ItemScreenWhichChoosedState extends State<ItemScreenWhichChoosed> {

  double _imageSize = 150.0;
  bool _isTapped = false;
  double _heightTake = 300;

  
  void _toggleSize()  {
    setState(() {
      _isTapped = !_isTapped;
      _heightTake = _isTapped ? 500 : 402;
      _imageSize = _isTapped ? 300.0 : 150.0;
    });
  }



  @override
  Widget build(BuildContext context) {
  var height = _heightTake;

    return Scaffold(
      appBar: AppBar(
        title: Text('Item Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              
            children: [
              
              Container(
                height: height,
                width: double.infinity,
                color: Colors.grey.shade200.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
        
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:18.0),
                      child: Text("Product", style: TextStyle(fontSize: 20, color: Colors.yellow.shade800),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:18.0),
                      child: Text(widget.itemName,style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                     SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                         child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Padding(
                              padding: EdgeInsets.only(right: 20),
                               child: SingleChildScrollView(
                                 child: GestureDetector(
                                  onTap: () {
                                    _toggleSize();
                                  },
                                   child: Center(
                                     child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      width: _imageSize,
                                      height: _imageSize,
                                       child: Container(
                                            width: 200,
                                            height: 110,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(widget.itemimg1),  // Replace with your image path
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                             
                             

                            //  ----sub varient 2
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                               child: GestureDetector(
                                onTap: () {
                                  _toggleSize();
                                },
                                 child: Center(
                                   child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: _imageSize,
                                    height: _imageSize,
                                     child: Container(
                                          width: 200,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(widget.itemimg3),  // Replace with your image path
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                   ),
                                 ),
                               ),
                             ),


                            //  -------------sub varient 3
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                               child: GestureDetector(
                                onTap: () {
                                  _toggleSize();
                                },
                                 child: Center(
                                   child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: _imageSize,
                                    height: _imageSize,
                                     child: Container(
                                          width: 200,
                                          height: 110,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(widget.itemimg2),  // Replace with your image path
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                   ),
                                 ),
                               ),
                             ),                     
                          ],
                         ),
                       ),
                     ),

                  ],
                ),


              ),



            
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              
              child: Text("Deal Price", style: TextStyle(color: Colors.yellow.shade900,fontSize: 20),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Row(
                children: [
                  Text("-20%", style: TextStyle(color: Colors.yellow.shade900, fontSize: 20 ),),
                  SizedBox(width: 10,),
                  Text("Rs. 96", style: TextStyle(color: Colors.black, fontSize: 26,fontWeight: FontWeight.bold ),),
                ],
              ),
            ) ,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text("M.R.P: ", style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
                  Text("Rs.120", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20,decoration: TextDecoration.lineThrough),),
                ],
              ),

            ) ,


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              
              child: Text("(You are saving Rs.24)", style: TextStyle(color: Colors.green),),
            )
                ],
              ),

              


              // expandedtile from here

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.grey),
                      color:Colors.grey.shade100.withOpacity(0.9),
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    trailing: Icon(Icons.expand_circle_down, color: Colors.yellow.shade900,),
                      title: Text('Product Details', style: TextStyle(color: Colors.yellow.shade900),),
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              // Content of the expanded section
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Colors.grey.shade100.withOpacity(0.9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(widget.productdesciption),
                                  )
                                ],
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ),



              // ------------------------------product reviews
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.grey),
                      color:Colors.grey.shade100.withOpacity(0.9),
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    trailing: Icon(Icons.expand_circle_down, color: Colors.yellow.shade900,),
                      title: Text('Product Details', style: TextStyle(color: Colors.yellow.shade900),),
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Container(
                              // Content of the expanded section
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color:Colors.grey.shade100.withOpacity(0.9),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Text(widget.productreview),
                                  )
                                ],
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ),


                Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Colors.grey),
                      color:Colors.grey.shade100.withOpacity(0.9),
                  ),
                 child:ExpansionTile(
                 trailing: IconButton(icon: Icon(Icons.expand_circle_down_rounded),onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SupplyScreen();
                            }));
                },),
                title: Text("View Supply Details", style: TextStyle(color:Colors.yellow.shade900),
              )))
                ),





              

            ],
          ),
        ),

      )
    );
  }
}
