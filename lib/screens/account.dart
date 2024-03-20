import 'package:flipkart/screens/myOrders.dart';
import 'package:flipkart/screens/wishlist.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 170,
            width: double.infinity,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Hey! Flipkart Customer",style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'AnekLatin',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),),
                const Text("Explore",style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'AnekLatin',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180.0,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyOrders()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.my_library_books_outlined,color: Colors.blue,),
                              SizedBox(width: 10.0,),
                              Text("Orders",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AnekLatin',
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                              ),)
                            ],
                          )),
                    ),
                    Container(
                      width: 180.0,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WishList()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.favorite_outline,color: Colors.blue,),
                              SizedBox(width: 10.0,),
                              Text("Wishlist",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AnekLatin',
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                              ),)
                            ],
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180.0,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.countertops_outlined,color: Colors.blue,),
                              SizedBox(width: 10.0,),
                              Text("Coupons",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AnekLatin',
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                              ),)
                            ],
                          )),
                    ),
                    Container(
                      width: 180.0,
                      child: ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.headset_mic_sharp,color: Colors.blue,),
                              SizedBox(width: 10.0,),
                              Text("Help Center",style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'AnekLatin',
                                fontSize: 17.0,
                                letterSpacing: 0.5,
                              ),)
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
