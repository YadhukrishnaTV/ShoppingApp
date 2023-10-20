import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/model.dart';
import 'package:shopping/utils/color_const.dart';
import 'package:shopping/view/cart/cart.dart';

import '../../controller/provider/myprovider.dart';

class DetailsScreen extends StatefulWidget {
  final int itemIndex;
  const DetailsScreen({super.key, required this.itemIndex});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  
 

  get backgroundColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorco.bgcolor,
        title: Text("Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: colorco.textcolor)),
        actions: [Icon(Icons.notifications,color: Colors.black,)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
            
              child: Image(image: NetworkImage(items[widget.itemIndex]["image"])),
            ),
            
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(items[widget.itemIndex]["name"],
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(Icons.star,color: Colors.black,),
                Text("4.5/5",style: TextStyle(color: colorco.textcolor,fontWeight: FontWeight.w900,fontSize:17 ),),
                SizedBox(width: 6,),
                Text("(45 Reviews)")
              ],),
            ),
            SizedBox(height: 10,),
            Text("This comfy feather T-shirt will become a new everyday favorite. The cute elbow length sleeves will enhance the gracefulness of each move you make. The draping cape sleeves show off your feminine flair while flattering your figure.",
            style: TextStyle(color: colorco.textcolor,fontSize: 18),
            ),SizedBox(width: 10,height: 10,),
            Row(
              children: [
                Text("Choose Size",style: TextStyle(color: colorco.textcolor,fontSize: 20,fontWeight: FontWeight.w800),),
              ],
            ),
             SizedBox(width: 10,height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                Container(height: 30,
                width: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 134, 133, 133),),
                child: Center(child: Text("S",style: TextStyle(color: colorco.textcolor,fontSize: 20,fontWeight: FontWeight.w900),)),
                       ),
                        SizedBox(width: 10,),
                Container(height: 30,
                width:40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 134, 133, 133),),
                child: Center(child: Text("M",style: TextStyle(color: colorco.textcolor,fontSize: 20,fontWeight: FontWeight.w900),)),
                       ),
                        SizedBox(width: 10,),
                Container(height: 30,
                width: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 134, 133, 133),),
                child: Center(child: Text("L",style: TextStyle(color: colorco.textcolor,fontSize: 20,fontWeight: FontWeight.w900),)),
                       ),
                
              ],
            ),
             
      
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(height: 30,
                            width: 60,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,),
                            
                    child: Center(child: Text("Price",style: TextStyle(color: const Color.fromARGB(255, 248, 246, 246),fontSize: 16,fontWeight: FontWeight.w700),))),
                    SizedBox(width: 5,),
                    Container(height: 30,
                            width: 60,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,),
                            
                      child: Center(child: Text(items[widget.itemIndex]["price"],style: TextStyle(color: Colors.white),))),
                   SizedBox(width: 30,),
                     OutlinedButton(
                    onPressed: (){
                       Provider.of<myprovider>(context,listen: false).decrrement();
                   }, child:Text("-",style: TextStyle(color: Colors.blue,fontSize: 40),)),
                 
                  Text(
          Provider.of<myprovider>(context).counter.toString(),
                style:TextStyle(fontSize: 30,fontWeight: FontWeight.w800)
              ),
               OutlinedButton(onPressed: (){
                   Provider.of<myprovider>(context,listen: false).increment();
                  }, child: Icon(Icons.add)),
                  
                 
                ],
              ),
          ],
        ),
        
      ),
     bottomNavigationBar:Container(
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total : ${Provider.of<myprovider>(context).pricecal(1999)}",
          style: TextStyle(color: colorco.bgcolor,fontSize: 20,fontWeight: FontWeight.w700),),
          InkWell(
            // onTap: (){
            //   Provider.of<myprovider>(context).addData(
            //     // Cartmodel( )
            //   );
            // },
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ColorConstant.primaryTextColor)),
                onPressed: () {
                  // Navigator.push(context, 
                  // MaterialPageRoute(builder: 
                  // (context)=>Cart()));
                  Provider.of<myprovider>(context).addToCart(widget.itemIndex);
                  const snackBar = SnackBar(
                    content:
                        Text('Product added to cart successfully.'),
                    backgroundColor: Colors.black,
                  );
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar);
                  // myprovider.Reset();
                },
                child: Text(
                  'Add Cart',
                  style: TextStyle(fontSize: 17),
                )),
          )
        ],
      ),
      color: Colors.black,
     ),
          
         
    );
  }
}