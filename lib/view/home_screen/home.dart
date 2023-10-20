import 'package:flutter/material.dart';
import 'package:shopping/model/model.dart';
import 'package:shopping/utils/color_const.dart';
import 'package:shopping/view/cart/cart.dart';
import 'package:shopping/view/details_screen/details_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});





  @override
  Widget build(BuildContext context) {
  //     final List<String> mylist = [
  // "All"
  // "Men"
  // "Women"
  // "Kids"
  // ];
    return Scaffold(
      appBar: AppBar(title: Text("Discover",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: colorco.textcolor),),
      actions: [InkWell(
        onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)
          =>Cart()));
        },
        child: Icon(Icons.notifications,color: colorco.textcolor,))],backgroundColor: colorco.bgcolor,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 40,width: 330, 
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
                  ,color: Color.fromARGB(255, 173, 170, 170),),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search,color: colorco.textcolor,),
                      Text("Search Anything",style: TextStyle(color: colorco.textcolor),)
                    ],
                  ),),
                ),
      
                Icon(Icons.filter_vintage)
              ],
            ),
            // ListView.builder(itemCount:mylist.length,
            //   itemBuilder: (context, index)=>
            // Container(
            //                 padding: EdgeInsets.all(5),
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(15),
            //                   color: const Color.fromARGB(255, 65, 65, 64),
            //                 ),
            //                 child: Center(
            //                   child: Text(mylist[index]),
            //                 ),
            //               ),)
      
           GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 350),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                 onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                      itemIndex: index,)
                        
                      
                    ));
              },
                child: Container(
                  height: 300,
                  width: 100,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Stack(
                          children: [
                            Container(
                              height: 230,
                              width: double.infinity,
                              
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(items[index]["image"]))),
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              color: Color.fromARGB(255, 253, 251, 251),
                              child: Icon(Icons.favorite_border_outlined,color: colorco.textcolor,),
              
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Text(
                            items[index]["name"],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Text(items[index]["price"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                        )
                      ]),
                ),
              ),
            ),
          )
          ],
        ),
      ) ,
    );
  }
}