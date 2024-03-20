import 'package:flipkart/main.dart';
import 'package:flipkart/screens/home.dart';
import 'package:flipkart/screens/specificProduct.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/mycart.dart';
import '../services/productService.dart';
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  double ttl_amt = 0;
  String selectedQuantity = '1';
  int count = 0;
  String discount = '';

  List<MyCart>? cart;
  var isLoaded = false;
  int ttl = 0;

  ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    getCartProducts();
  }

  getCartProducts() async{
    cart = await _productService.DisplayCart();
    if(cart != null){
      setState(() {
        isLoaded = true;
      });
    }
    ttl = cart!.length;
  }

  bool check = false;


  @override
  Widget build(BuildContext context) {

    if(isLoaded && cart?.length == 0){
      check = true;
    }

    ttl_amt = cart?.fold(0, (total, item) {
      return total! + (int.parse(item.price.replaceAll(',', '')) * int.parse(selectedQuantity));
    }) ?? 0;

    print(check);

    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: check ? const CircularProgressIndicator() : emptyCart(),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cart?.length,
                  itemBuilder: (context, index){

                    ttl = cart!.length;
                    final item = cart![index];
                    ttl_amt += int.parse(item.price.toString().replaceAll(',', ''));
                    discount = cart![index].offer.toString();

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      margin: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificProduct(id: cart![index].id, cart: cart![index].cart, key: null,)));
                          });
                        },
                        child: Container(
                            height: 310,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 130,
                                      child: Image.network(
                                        cart![index].photoUrls[0],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 180,
                                          padding: const EdgeInsets.only(top: 1),
                                          child: Text(cart![index].name,style: const TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'AnekLatin',
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        ),
                                        Container(
                                          width: 180,
                                          padding: const EdgeInsets.only(top: 3),
                                          child: Text(cart![index].ram,style: const TextStyle(
                                            fontSize: 15.0,
                                            fontFamily: 'AnekLatin',
                                            letterSpacing: 0.5,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),),
                                        ),
                                        const SizedBox(height: 10.0,),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Text(cart![index].offer,style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'AnekLatin',
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                ),),

                                                const SizedBox(width: 10.0,),

                                                Text(cart![index].price,style: const TextStyle(
                                                  fontSize: 15.0,
                                                  fontFamily: 'AnekLatin',
                                                  fontWeight: FontWeight.w800,
                                                ),),
                                              ],
                                            )
                                        ),
                                        const SizedBox(height: 10.0,),
                                        const Text(" + ₹232 Secured Packaging Fee",style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'AnekLatin',
                                          fontSize: 12.0,
                                        ),),
                                        const SizedBox(height: 10.0,),
                                        const Text("5 Offers Applied , 3 Offers Available",style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'AnekLatin',
                                          fontSize: 12.0,
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50.0,
                                  padding: const EdgeInsets.only(left: 35.0),
                                  child: DropdownButton<String>(
                                    value: selectedQuantity,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedQuantity = newValue!;
                                        ttl *= int.parse(selectedQuantity);
                                      });
                                    },
                                    items: <String>['1', '2', '3', '4']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text('Qty : $value'),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                const SizedBox(height: 10.0,),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Text(cart![index].delivery,style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'AnekLatin',
                                        fontSize: 13.0,
                                      ),),
                                      const SizedBox(width: 5.0,),
                                      const Text('| ₹320',style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.lineThrough,
                                        fontFamily: 'AnekLatin',
                                        fontSize: 13.0,
                                      ),),
                                      const SizedBox(width: 5.0,),
                                      const Text('FREE DELIVERY',style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'AnekLatin',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.0,
                                      ),),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(1.0),
                                          ),
                                          child: TextButton(
                                              onPressed: (){},
                                              child: const Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.save_alt_sharp,size: 15.0,color: Colors.grey,),
                                                  SizedBox(width: 5.0,),
                                                  Text("Save for Later",style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: 'AnekLatin',
                                                    fontSize: 15.0,
                                                  ),)
                                                ],
                                              )
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(1.0),
                                          ),
                                          child: TextButton(
                                              onPressed: (){

                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: (){
                                                      removeItem(cart![index].cart,cart![index].id);
                                                    },
                                                    child: const Row(
                                                      children: [
                                                        Icon(Icons.delete_outline,size: 15.0,color: Colors.grey,),
                                                        SizedBox(width: 5.0,),
                                                        Text("Remove",style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily: 'AnekLatin',
                                                          fontSize: 15.0,
                                                        ),)
                                                      ],
                                                    ),
                                                  ),

                                                ],
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ]
                            )
                        ),
                      ),
                    );
                  }
              ),
            ),
            //Second Container
            Container(
              height: 250.0,
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price Details",style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'AnekLatin',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),),
                  const SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Price ($ttl item)",style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("₹ $ttl_amt",style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Discount",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("- ₹$discount",style: const TextStyle(
                        color: Colors.green,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Charges",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("FREE Delivery",style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Secured Packaging Fee",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("₹30",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Amount",style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                      Text("₹$ttl_amt",style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'AnekLatin',
                        fontSize: 15.0,
                        letterSpacing: 0.5,
                      ),),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  const Text("You will Save 5000 on this order",style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'AnekLatin',
                    fontSize: 15.0,
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$ttl_amt',style: const TextStyle(
              color: Colors.black,
              fontFamily: 'AnekLatin',
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
            ),),
            Container(
              width: 150.0,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFffc300),
                  ),
                  onPressed: (){},
                  child: const Text('Place Order',style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                    fontFamily: 'AnekLatin',
                    fontWeight: FontWeight.bold,
                  ),)
              ),
            )
          ],
        )
      ],
    );
  }

  emptyCart() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.shopping_cart,
              size: 100,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start adding items to your cart',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Flipkart()));
              },
              child: const Text('Start Shopping'),
            ),
          ],
        ),
      ),
    );
  }

  removeItem(String cart,String id){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Do You want to remove the item from the Cart",style: TextStyle(
              color: Colors.black,
              fontFamily: 'AnekLatin',
              fontSize: 17.0,
            ),),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: (){
                      setState(() {
                        if(cart == '1') {
                          _productService.handleDeUpdateCart(id);
                          Fluttertoast.showToast(
                              msg: 'Product Removed from Cart'
                          );
                          getCartProducts();
                          Navigator.pop(context);

                        }
                      });
                    },
                    child: Text("Remove")
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")
                )
              ],
            ),
          );
        }
    );
  }
}
