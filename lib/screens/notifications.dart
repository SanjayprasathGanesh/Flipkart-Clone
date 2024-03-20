import 'package:flipkart/screens/allProducts.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  String msg = 'Get 5% Unlimited Cashback on all online Trnx + 10,000* Gift Card with Flipkart Axis Bank Credit Card. Apply Now';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 170,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Double your Savings!",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'AnekLatin',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),),
                    const Row(
                      children: [
                        Icon(Icons.circle,color: Colors.red,size: 10.0,),
                        SizedBox(width: 5.0,),
                        Text("10 days ago",style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'AnekLatin',
                          fontSize: 14.0,
                          letterSpacing: 0.8,
                        ),),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      children: [
                        Container(
                            height: 80,
                            width: 150,
                            child: Image.network('https://cardinsider.com/wp-content/uploads/2022/11/Flipkart-Axis-Bank-Super-Elite-Credit-Card.png')
                        ),
                        Expanded(
                          child: Text(msg,style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            fontFamily: 'AnekLatin',
                            letterSpacing: 0.5,
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Explore Samsung Smart Phones With best Deal",style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'AnekLatin',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),),
                    const Row(
                      children: [
                        Icon(Icons.circle,color: Colors.red,size: 10.0,),
                        SizedBox(width: 5.0,),
                        Text("12 days ago",style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'AnekLatin',
                          fontSize: 14.0,
                          letterSpacing: 0.8,
                        ),),
                      ],
                    ),
                    // const SizedBox(height: 5.0,),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 175,
                          width: double.infinity,
                          child: Image.network(
                            // 'https://phoneaqua.com/assets/images/brands/651d209731244_samsung%20top%20phones%202023.jpg'
                            'https://fdn.gsmarena.com/imgroot/static/headers/makers/samsung-2023-1.jpg'
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              'Top Samsung Smart Phones',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AnekLatin',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'From 19,999',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'AnekLatin',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProducts()));
                                },
                                child: const Text("Shop Now > ",style: TextStyle(
                                  color: Colors.black,
                                ),)
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
