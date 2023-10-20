import 'package:flutter/material.dart';
import 'package:shopping/model/model.dart';
import 'package:shopping/view/cart/cart.dart';

class myprovider with ChangeNotifier{
   int counter = 1;
   List<Cartmodel> cart = [];
     List<CartModel> cartItems = [];
     
       
  
  void increment() {
     {
     counter= counter+1;
      notifyListeners();
    };
  }
  void decrrement(){
     {
      
     counter= counter-1;
      notifyListeners();
     };
  }
  void deletecart(int index){
    cart.removeAt(index);
    print("item Deleted");
    notifyListeners();
      }

   void addData(Cartmodel product){
   Cart.add(product);
    notifyListeners();
      } 

      String pricecal(int price, )
      {
        int? total = price * counter;
        print(total);
        notifyListeners();
        return total.toString();
      }

    //   void addToCart(int index) {
    // Iterable<CartModel> visibleItem =
    //     CartModel.where((item) => item.name!.contains(items[index]['name']));

    // if (visibleItem.isEmpty) {
    //   CartModel.add(CartModel(
    //       name: items[index]['name'],
    //       price: items[index]['price'],
    //       finalPrice: null,
    //       image: items[index]['image'], itemCount: counter,
    //       ));
    // } else {
    //   visibleItem.forEach((item) {
    //     item.itemCount = item.itemCount! + counter;
    //   });
    // }
  //   notifyListeners();
  // }
   void resetItemCount() {
    counter = 1;
    notifyListeners();
  }

  void addToCart(int itemIndex) {}
  //  void isCart(int index) {
  //   Iterable<CartModel> matchingItem =
  //       cartItems.where((item) => item.name!.contains(items[index]['name']));
  //   if (matchingItem.isEmpty) {
  //     isCartContains = false;
  //   } else {
  //     isCartContains = true;
  //   }
  //   notifyListeners();
  // }
  

  }
