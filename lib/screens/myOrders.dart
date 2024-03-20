import 'package:flutter/material.dart';

import '../main.dart';
import '../models/ordersModel.dart';
import '../services/productService.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  List<Orders>? orders;
  var isLoaded = false;

  ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  getOrders() async{
    orders = await _productService.fetchOrders();
    if(orders != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  bool check = false;

  @override
  Widget build(BuildContext context) {

    if(isLoaded && orders?.length == 0){
      check = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders",style: TextStyle(
          fontFamily: 'AnekLatin',
          fontSize: 15.0,
        ),),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: check ? const CircularProgressIndicator() : emptyOrders(),
        ),
        child: ListView.builder(
            itemCount: orders?.length,
            itemBuilder: (context, index){

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
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificProduct(id: id, cart: cart, key: null)));
                    });
                  },
                  child: Container(
                      height: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120,
                                height: 130,
                                padding: EdgeInsets.all(2.0),
                                child: Image.network(
                                  orders![index].photoUrls[0],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 180,
                                    padding: const EdgeInsets.only(top: 1),
                                    child: Text(orders![index].delivery,style: const TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ),
                                  const SizedBox(height: 10.0,),
                                  Container(
                                    width: 180,
                                    padding: const EdgeInsets.only(top: 3),
                                    child: Text(orders![index].name,style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                      fontFamily: 'AnekLatin',
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                  ),
                                  const SizedBox(height: 10.0,),
                                ],
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {

                                    });
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios,size: 25.0,),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  emptyOrders() {
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
              'Your Orders are Empty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start adding items to your cart And Order it soon',
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
}
