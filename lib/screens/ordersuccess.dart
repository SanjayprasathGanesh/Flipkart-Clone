import 'package:flipkart/screens/home.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class OrderSuccessPage extends StatefulWidget {
  @override
  _OrderSuccessPageState createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> {
  double opacityLevel = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animation when the widget is first built
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        opacityLevel = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Success'),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1), // Animation duration
          opacity: opacityLevel,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 80.0,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Order Placed Successfully!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0,),
              TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Flipkart()));
                  },
                  child: const Text("Back to Shooping",style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrderSuccessPage(),
  ));
}
