import 'package:flutter/material.dart';


class SupplyScreen extends StatefulWidget {
  const SupplyScreen({super.key});

  @override
  State<SupplyScreen> createState() => _SupplyScreenState();
}

class _SupplyScreenState extends State<SupplyScreen> {

  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
    
        appBar: AppBar(
          elevation: 0,
          title: Text("Supply Details", style: TextStyle(color: Colors.yellow.shade900, fontSize: 20, fontWeight: FontWeight.bold),),),
        body: Stepper(
          currentStep: currentStep,
          onStepContinue: () {
            if (currentStep < 2) {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: Text('Production'),
              content: Container(
                height: 300,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Collection of Row Material", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxxfMLpWwAEXLDv?format=png&name=900x900"),)),
                        Expanded(child: Text("About Product Information"))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Recieved Row Material", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxxfMLpWwAEXLDv?format=png&name=900x900"),)),
                        Expanded(child: Text("Recieved Product Information"))
                      ],
                    ),
    
                  ],
                ),
              ),
              isActive: currentStep == 0,
            ),
            
    
            // ---------------- Manufacturing
            Step(
              title: Text('Manufacturing'),
              content: Container(
                height: 300,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Processed", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxxfMLpWwAEXLDv?format=png&name=900x900"),)),
                        Expanded(child: Text("Packaging Information"))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Packing of Product", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxxfMLpWwAEXLDv?format=png&name=900x900"),)),
                        Expanded(child: Text("Packed information"))
                      ],
                    ),
                  ],
                ),
              ),
              isActive: currentStep == 0,
            ),
    
    
            // delivery status
            Step(
              title: Text('Delivery'),
              content: Container(
                height: 300,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivered To Store", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxxfMLpWwAEXLDv?format=png&name=900x900"),)),
                        Expanded(child: Text("Reliance Store, Mg. Road"))
                      ],
                    ),
                    SizedBox(height: 20,),
                    Text("Delivered To Customer", style:TextStyle(color: Colors.black, fontSize: 18),),
                    Row(
                      children: [
                        Expanded(child: Container(height: 100, width: 200,child: Image.network("https://pbs.twimg.com/media/FxyfEuyWYAAWiVH?format=jpg&name=medium"))),
                        Expanded(child: Column(
                          children: [
                            Icon(Icons.check, color: Colors.green,),
                            Text("Delivered To Rohan "),
                            Text("Id :202XX"),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
              isActive: currentStep == 0,
            ),
    
    
    
          ],
    
        ),
      ),
    );

      }
    }