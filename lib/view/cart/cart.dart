import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/controller/provider/myprovider.dart';
import 'package:shopping/model/model.dart';
import 'package:shopping/utils/color_const.dart';


class Cart extends StatefulWidget {
  final int? itemIndex;
  const Cart({super.key, this.itemIndex});

  @override
  State<Cart> createState() => _CartState();

  static void add(Cartmodel product) {}
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<myprovider>(context).cartItems;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<myprovider>(context, listen: false)
                    .resetItemCount();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorConstant.primaryTextColor,
              )),
          backgroundColor: ColorConstant.backgroundColor,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
                color: ColorConstant.primaryTextColor,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          )),
      body: provider.isEmpty
          ? Center(
              child: Text('empty'),
            )
          : ListView.builder(
              itemCount:
                  Provider.of<myprovider>(context).cartItems.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                      decoration: BoxDecoration(
                        color: ColorConstant.textFieldBg,
                      ),
                      child: Center(
                        child: Icon(Icons.delete_outline_outlined),
                      )),
                  onDismissed: (direction) {
                    Provider.of<myprovider>(context).deletecart(index);
                    const snackBar = SnackBar(
                      content: Text('Item removed from cart successfully'),
                      backgroundColor: Colors.black,
                    );
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  key: Key(Provider.of<myprovider>(context)
                      .cartItems
                      .toString()),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 217, 217, 217),
                        border: Border.all(color: ColorConstant.textFieldBg),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 7),
                            child: Container(
                              height: 180,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        Provider.of<myprovider>(
                                                context)
                                            .cartItems[index]
                                            .image
                                            .toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    Provider.of<myprovider>(context)
                                        .cartItems[index]
                                        .name
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<myprovider>(
                                                  context,
                                                  listen: false)
                                              .addData(index as Cartmodel);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: ColorConstant
                                                  .primaryTextColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5))),
                                          child: Center(
                                              child: Text(
                                            '+',
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .backgroundColor,
                                                fontSize: 15),
                                          )),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color:
                                                ColorConstant.primaryTextColor),
                                        child: Center(
                                            child: Text(
                                          Provider.of<myprovider>(
                                                  context)
                                              .cartItems[index]
                                              .itemCount
                                              .toString(),
                                          style: TextStyle(
                                              color:
                                                  ColorConstant.backgroundColor,
                                              fontSize: 15),
                                        )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Provider.of<myprovider>(
                                                  context,
                                                  listen: false)
                                              .resetItemCount();
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: ColorConstant
                                                  .primaryTextColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5))),
                                          child: Center(
                                              child: Text(
                                            '-',
                                            style: TextStyle(
                                                color: ColorConstant
                                                    .backgroundColor,
                                                fontSize: 16),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 100, 100, 100),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // Text(
                                      //   '₹${Provider.of<myprovider>(context).pricecal(Provider.of<myprovider>(context).cartItems[index].price!, provider[index].counter!)}',
                                      //   style: TextStyle(
                                      //       color: Colors.red,
                                      //       fontSize: 25,
                                      //       fontWeight: FontWeight.w600),
                                      // )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: ColorConstant.backgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: IconButton(
                                      onPressed: () {
                                        Provider.of<myprovider>(
                                                context,
                                                listen: false)
                                            .deletecart(index);
                                        const snackBar = SnackBar(
                                          content: Text(
                                              'Item removed from cart successfully.'),
                                          backgroundColor: Colors.black,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Center(
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: ColorConstant.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
    );
  }
}