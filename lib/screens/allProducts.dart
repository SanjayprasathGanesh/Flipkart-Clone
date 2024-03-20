import 'package:flipkart/screens/cart.dart';
import 'package:flipkart/screens/specificProduct.dart';
import 'package:flipkart/services/productService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/productModel.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {

  List<Products>? products;
  var isLoaded = false;

  ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  getProducts() async{
    products = await _productService.fetchMobilePhones();
    if(products != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  double d1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Searched Products",style: TextStyle(
          fontSize: 15.0,
          fontFamily: 'AnekLatin',
        ),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
            },
          ),
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: products?.length,
            itemBuilder: (context, index){
              // int i1 = products![index].battery.toString().length;
              // print(i1);
              // print(products![index].ram.toString().length.toString());

              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                margin: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (){
                    // print(products![index].id);
                    setState(() {
                      // if(products![index].id == '6523cef50b659d8d0c047744'){
                        String id = products![index].id;
                        String? cart = products![index].cart;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificProduct(id: id, cart: cart, key: null)));
                      // }
                    });
                  },
                  child: Container(
                    height: 290,
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
                                products![index].photoUrls[0],
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 180,
                                  padding: const EdgeInsets.only(top: 1),
                                  child: Text(products![index].name,style: const TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'AnekLatin',
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                Container(
                                  width: 180,
                                  padding: const EdgeInsets.only(top: 3),
                                  child: const Text('#Just Here',style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'AnekLatin',
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ),
                                const SizedBox(height: 10.0,),
                                Container(
                                  width: 180,
                                  child: Row(
                                    children: [
                                      Text(products![index].offer,style: const TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'AnekLatin',
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),),

                                      const SizedBox(width: 10.0,),

                                      Text(products![index].price,style: const TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'AnekLatin',
                                        fontWeight: FontWeight.w800,
                                      ),),
                                    ],
                                  )
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (products![index].wishlist == '0') {
                                      products![index].wishlist = '1';
                                      _productService.handleUpdateWishlist(products![index].id);
                                      Fluttertoast.showToast(
                                          msg: 'Product Added to Wishlist'
                                      );
                                    } else {
                                      products![index].wishlist = '0';
                                      _productService.handleDeUpdateWishlist(products![index].id);
                                      Fluttertoast.showToast(
                                          msg: 'Product Removed from Wishlist'
                                      );
                                    }
                                  });
                                },
                                icon:
                                  products![index].wishlist == '1' ? const Icon(Icons.favorite_sharp,color: Colors.red,) : Icon(Icons.favorite_outline_rounded),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0,),
                        Container(
                          width: 135,
                          height: 33,
                          margin: const EdgeInsets.only(left: 20.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Text(products![index].ram,style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'AnekLatin',
                                fontSize: 12.0,
                              ),)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Container(
                              width: 195,
                              height: 33,
                              margin: const EdgeInsets.only(left: 20.0),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(products![index].display,style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'AnekLatin',
                                    fontSize: 12.0,
                                  ),)
                                ],
                              ),
                            ),
                            Container(
                              width: 110,
                              // width: i1.toDouble(),
                              height: 33,
                              margin: const EdgeInsets.only(left: 20.0),
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(products![index].battery,style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'AnekLatin',
                                    fontSize: 12.0,
                                  ),)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0,),
                        Container(
                          width: 240,
                          height: 33,
                          margin: const EdgeInsets.only(left: 20.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Text(products![index].camera,style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'AnekLatin',
                                fontSize: 12.0,
                              ),)
                            ],
                          ),
                        )
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
}
