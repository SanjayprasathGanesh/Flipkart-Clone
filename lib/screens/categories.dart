import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  String selected = 'For You';

  bool showContent = false;

  void _toggleContent() {
    setState(() {
      showContent = !showContent;
    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'For You';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'For You' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://images.assettype.com/fortuneindia%2F2018-05%2Ffe6f2dac-235f-42e8-b3a6-67a70e08a997%2Fwallmart_and_flipcart.jpg?rect=0,0,1249,703&w=1250&q=60'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('For You',style: TextStyle(
                            color: selected == 'For You' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Fashion';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Fashion' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/fk-p-flap/64/64/image/0d75b34f7d8fbcb3.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Fashion',style: TextStyle(
                            color: selected == 'Fashion' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Grocery';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Grocery' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/29327f40e9c4d26b.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Grocery',style: TextStyle(
                            color: selected == 'Grocery' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Mobile';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Mobile' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/22fddf3c7da4c4f4.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Mobile',style: TextStyle(
                            color: selected == 'Mobile' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Electronics' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/69c6589653afdb9a.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Electronics',style: TextStyle(
                            color: selected == 'Electronics' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Appliances';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Appliances' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/0ff199d1bd27eb98.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Appliances',style: TextStyle(
                            color: selected == 'Appliances' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Travel';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Travel' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/71050627a56b4693.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Travel',style: TextStyle(
                            color: selected == 'Travel' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Toys';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Toys' ? Colors.white : Colors.grey,
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim1.flixcart.com/flap/64/64/image/dff3f7adcf3a90c6.png?q=100'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Toys',style: TextStyle(
                            color: selected == 'Toys' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selected = 'Beauty';
                      });
                    },
                    child: Container(
                      height: 70,
                      width: 90,
                      color: selected == 'Beauty' ? Colors.white : Colors.grey,
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage('https://rukminim2.flixcart.com/image/832/832/kuh9yfk0/sari/5/5/f/free-lycra-lace-ready2wear2-saree-arra-enterprise-unstitched-original-imag7h6jfebdeysf.jpeg?q=70'), // Replace with your image URL
                              backgroundColor: Colors.blueAccent,
                            ),
                          ),
                          const SizedBox(height: 5.0,),
                          Text('Beauty',style: TextStyle(
                            color: selected == 'Beauty' ? Colors.blue : Colors.black,
                            fontFamily: 'AnekLatin',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 100.0),
                child: SingleChildScrollView(
                  child: showCategories(selected),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showCategories(String name){

    print(name);

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    if(name == 'For You'){
      return Column(
        children: [
          const Text('Popular Stores',style: TextStyle(
            fontSize: 30.0,
          ),),
          Container(
              height: 160,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / 400),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imageUrls = [
                    'https://rukminim1.flixcart.com/flap/64/64/image/22fddf3c7da4c4f4.png?q=100',
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/t-shirt/r/v/k/m-ausk0165-ausk-original-imaghu9fbhcgf2za.jpeg?q=70',
                    'https://rukminim2.flixcart.com/image/832/832/l4x2rgw0/dress/l/c/5/s-186-blue-aahwan-original-imagfpcpchzxee7p.jpeg?q=70'
                  ];

                  List<String> subtitle = [
                    'Mobiles',
                    'Shirts & T-shirts',
                    'Womens Wear'
                  ];

                  return Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(imageUrls[index]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        subtitle[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const SizedBox(height: 10.0,),
          Container(
              height: 160,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / 400),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imageUrls = [
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/jean/u/z/s/32-udjeno1263-u-s-polo-assn-denim-co-original-imagthpfymkcejss.jpeg?q=70',
                    'https://rukminim2.flixcart.com/image/612/612/kqco5u80/jewellery-set/g/c/h/780-r-a-enterprises-original-imag4dyzceaqhkhp.jpeg?q=70',
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/shampoo/t/o/f/-original-imagkycygz4ajfhg.jpeg?q=70'
                  ];

                  List<String> subtitle = [
                    'Jeans',
                    'Jewellery',
                    'Hair Care'
                  ];

                  return Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(imageUrls[index]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        subtitle[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const SizedBox(height: 10.0,),
          const Text('Trending Stores',style: TextStyle(
            fontSize: 30.0,
          ),),
          Container(
              height: 160,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / 400),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imageUrls = [
                    'https://bl-i.thgim.com/public/incoming/ymtsi2/article66341501.ece/alternates/LANDSCAPE_1200/Logo_Flipkart%20Green.jpg',
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/hair-removal/f/f/6/200-hair-removal-cream-spray-for-men-painless-body-hair-removal-original-imagmycjha23e67v.jpeg?q=70',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnVhu3TVAxFkztpQ8njDvtknyHnJ8AlYq7J1mUzqYTGUFqHC1_P6jeBtOuW9G73MfHdgU&usqp=CAU'
                  ];

                  List<String> subtitle = [
                    'Flipkart Green',
                    'Mens Grooming',
                    'Travel Store'
                  ];

                  return Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(imageUrls[index]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        subtitle[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const SizedBox(height: 10.0,),
          Container(
              height: 160,
              width: double.infinity,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth / 400),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  List<String> imageUrls = [
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/jean/u/z/s/32-udjeno1263-u-s-polo-assn-denim-co-original-imagthpfymkcejss.jpeg?q=70',
                    'https://rukminim2.flixcart.com/image/612/612/kqco5u80/jewellery-set/g/c/h/780-r-a-enterprises-original-imag4dyzceaqhkhp.jpeg?q=70',
                    'https://rukminim2.flixcart.com/image/612/612/xif0q/shampoo/t/o/f/-original-imagkycygz4ajfhg.jpeg?q=70'
                  ];

                  List<String> subtitle = [
                    'Jeans',
                    'Jewellery',
                    'Hair Care'
                  ];

                  return Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(imageUrls[index]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        subtitle[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                },
              )
          ),
          const SizedBox(height: 10.0,),

        ],
      );
    }
  }
}
