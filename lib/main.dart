import 'package:flipkart/screens/cart.dart';
import 'package:flipkart/screens/categories.dart';
import 'package:flipkart/screens/home.dart';
import 'package:flipkart/screens/account.dart';
import 'package:flipkart/screens/notifications.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: Flipkart(),
    debugShowCheckedModeBanner: false,
  ));
}

class Flipkart extends StatefulWidget {
  const Flipkart({super.key});

  @override
  State<Flipkart> createState() => _FlipkartState();
}

class _FlipkartState extends State<Flipkart> {


  int current_page = 0;
  final pages = [
    const Home(),
    const Categories(),
    const Notifications(),
    const Account(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(top: 8.0,left: 8.0,bottom: 8.0),
          child: const Image(
            image: AssetImage(
              'images/flipkart.png',
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
        title: const Text("Flipkart",style: TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),),
      ),
      body: pages[current_page],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      current_page = 0;
                    });
                  },
                  icon: current_page == 0
                      ? const Icon(
                    Icons.home_outlined,
                    color: Colors.blue,
                    size: 25,
                  )
                      : const Icon(
                    Icons.home_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text("Home",style: TextStyle(
                    fontSize: 12.0,
                    color: current_page == 0 ? Colors.blue : Colors.black
                ),),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      current_page = 1;
                    });
                  },
                  icon: current_page == 1
                      ? const Icon(
                    Icons.category_outlined,
                    color: Colors.blue,
                    size: 25,
                  )
                      : const Icon(
                    Icons.category_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text("Categories",style: TextStyle(
                    fontSize: 12.0,
                    color: current_page == 1 ? Colors.blue : Colors.black
                ),),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      current_page = 2;
                    });
                  },
                  icon: current_page == 2
                      ? const Icon(
                    Icons.notifications_none,
                    color: Colors.blue,
                    size: 25,
                  )
                      : const Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text("Notifications",style: TextStyle(
                    fontSize: 12.0,
                    color: current_page == 2 ? Colors.blue : Colors.black
                ),),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      current_page = 3;
                    });
                  },
                  icon: current_page == 3
                      ? const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.blue,
                    size: 25,
                  )
                      : const Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text("Account",style: TextStyle(
                    fontSize: 12.0,
                    color: current_page == 3 ? Colors.blue : Colors.black
                ),),
              ],
            ),
            Column(
              children: [
                IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      current_page = 4;
                    });
                  },
                  icon: current_page == 4
                      ? const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.blue,
                    size: 25,
                  )
                      : const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text("Cart",style: TextStyle(
                    fontSize: 12.0,
                    color: current_page == 4 ? Colors.blue : Colors.black
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

