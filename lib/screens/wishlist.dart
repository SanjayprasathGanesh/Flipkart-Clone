import 'package:flipkart/screens/specificProduct.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../main.dart';
import '../models/wishlistModel.dart';
import '../services/productService.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int count = 0;
  List<Wishlist>? wishlistItems;
  var isLoaded = false;
  ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async {
    wishlistItems = await _productService.DisplayWishlist();
    if (wishlistItems != null) {
      setState(() {
        isLoaded = true;
        count = wishlistItems!.length;
      });
    }
  }

  bool check = false;

  @override
  Widget build(BuildContext context) {

    if(isLoaded && wishlistItems?.length == 0){
      check = true;
    }

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlist",
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: 'AnekLatin',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Wishlist",
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontFamily: 'AnekLatin',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const Icon(
                  Icons.lock,
                  color: Colors.grey,
                  size: 20.0,
                ),
                const Text(
                  "Private ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'AnekLatin',
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  "$count items",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'AnekLatin',
                    fontSize: 13.0,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0,),
            Visibility(
              visible: isLoaded,
              replacement: Center(
                child: check ? const CircularProgressIndicator() : emptyWishList(),
              ),
              child: Expanded(
                child: isLoaded
                    ? GridView.builder(
                        shrinkWrap: true,
                        itemCount: wishlistItems!.length,
                        gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: (itemWidth / 380),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                        itemBuilder: (context, index) {
                          final item = wishlistItems![index];
                          return Card(
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SpecificProduct(id: wishlistItems![index].id,cart: wishlistItems![index].cart, key: null,)));
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10.0),
                                    height: 190,
                                    child: Image.network(wishlistItems![index].photoUrls[0]),
                                  ),
                                  Text(wishlistItems![index].name,style: const TextStyle(
                                    fontFamily: 'AnekLatin',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),),
                                  const SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(wishlistItems![index].price,style: const TextStyle(
                                        fontFamily: 'AnekLatin',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),),
                                      const SizedBox(width: 10.0,),
                                      Text(wishlistItems![index].offer,style: const TextStyle(
                                        fontFamily: 'AnekLatin',
                                        color: Colors.green,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0,),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star,color: Colors.green,),
                                      Icon(Icons.star,color: Colors.green,),
                                      Icon(Icons.star,color: Colors.green,),
                                      Icon(Icons.star,color: Colors.green,),
                                      Icon(Icons.star_border_outlined,color: Colors.green,),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: (){
                                        if(wishlistItems![index].cart == '0') {
                                          _productService.handleUpdateCart(wishlistItems![index].id);
                                          Fluttertoast.showToast(
                                              msg: 'Product Added to Cart'
                                          );
                                        }
                                        else{
                                          _productService.handleDeUpdateCart(wishlistItems![index].id);
                                          Fluttertoast.showToast(
                                              msg: 'Product Removed from Cart'
                                          );
                                        }
                                      },
                                      child: wishlistItems![index].cart == '1' ?
                                      const Text("Item in Cart",style: TextStyle(
                                        fontFamily: 'AnekLatin',
                                      ),) :
                                      const Text("Add To Cart",style: TextStyle(
                                        fontFamily: 'AnekLatin',
                                      ),)
                                  )
                                ],
                              ),
                            ),
                          );
                      },
                    )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  emptyWishList() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.favorite_outline_sharp,
              size: 100,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Wishlist is Empty',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Start adding items to your Wishlist',
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

