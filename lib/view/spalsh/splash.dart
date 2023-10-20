
import 'package:flutter/material.dart';
import 'package:shopping/view/bottom_screen/bottom_screen.dart';

class splashscreen extends StatelessWidget {
  
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(width: double.infinity,
          
            
            child: Image.network(
              "https://th.bing.com/th/id/OIP._WFn4STrEpvcaDy3p-ig5gHaLr?pid=ImgDet&w=199&h=314&c=7&dpr=1.3",
              fit: BoxFit.contain,
            ),
          ),
          // Image.asset("assets/image/fashionApp.png"),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavScreen(),
                    ));
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}