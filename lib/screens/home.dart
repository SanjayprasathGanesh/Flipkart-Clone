/*import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();
  bool text = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                TextField(
                  controller: search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,color: Colors.black,),
                    errorText: text ? 'Empty Search Field' : null,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Search..'
                  ),
                  autocorrect: true,
                  autofillHints: ['Samsung Phones','Samsung Tablets'],
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.search)
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}*/

import 'package:flipkart/screens/address.dart';
import 'package:flipkart/screens/allProducts.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController search = TextEditingController();
  bool text = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /*Container(
                    width: 200,
                    child: TextField(
                      controller: search,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          maxHeight: 20,
                          minWidth: 25,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.grey),
                        errorText: error ? 'Empty Search Field' : null,
                      ),
                    ),
                  ),*/
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5.0),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            maxHeight: 20,
                            minWidth: 25,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(color: Colors.grey),
                          errorText: error ? 'Empty Search Field' : null,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          /*if(search.toString() == 'Samsung Mobiles'){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProducts()));
                            error = false;
                          }
                          else if(search.toString().isEmpty){
                            setState(() {
                              error = true;
                            });
                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "No Results Found",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                            );
                          }*/
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AllProducts()));
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeAddress()));

                        });
                      },
                      child: const Text("Search",style: TextStyle(
                        fontFamily: 'AnekLatin',
                      ),)
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      height: 140,
                      width: double.infinity,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: (itemWidth / 300),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> imageUrls = [
                            'https://rukminim2.flixcart.com/image/612/612/xif0q/kurta/h/6/v/xl-sa19kr328w-surhi-original-imafpf3cqbzkxuhz-bb.jpeg?q=70',
                            'https://www.jiomart.com/images/product/original/rv54rem9qj/zaaliqa-latest-design-women-sling-bag-cross-body-bag-product-images-rv54rem9qj-0-202209271637.jpg?im=Resize=(1000,1000)',
                            'https://i.pinimg.com/736x/4b/ea/c1/4beac1a2ceb6ff197cd14c57547d5356.jpg'
                          ];

                          List<String> captions = [
                            'From 149',
                            'Under 199',
                            'Under 349'
                          ];

                          List<String> subtitle = [
                            'Kurthas',
                            'Bags,Watches',
                            'Mens Wear'
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
                              Container(
                                color: Colors.yellow,
                                child: Text(
                                  captions[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
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
                          childAspectRatio: (itemWidth / 300),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> imageUrls = [
                            'https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/3/a/tr:w-300,/3a5651aALIA1009_1.jpg',
                            'https://5.imimg.com/data5/SELLER/Default/2022/4/RR/VF/HU/149926717/new-factory-price-7-3inch-reolme7-pro-plus-smartphone-4g-5g-unlock-android-mobile-8gb-256gb-original.jpg',
                            'https://vaya.in/wp-content/uploads/2021/05/10-Must-Have-Appliances-for-Easy-Kitchen-Chores.jpg'
                          ];

                          List<String> captions = [
                            'From 299',
                            'Under 9,999',
                            'Under 99'
                          ];

                          List<String> subtitle = [
                            'Sarees',
                            'Smart Phones',
                            'Home & Kitchen'
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
                              Container(
                                color: Colors.yellow,
                                child: Text(
                                  captions[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
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
                  const SizedBox(height: 20.0,),
                  const Text("Recently Viewed Stores",
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10.0,),
                  Container(
                    height: 160,
                    width: double.infinity,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (itemWidth / 300),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        List<String> imageUrls = [
                          'https://5.imimg.com/data5/SELLER/Default/2023/4/303137346/ZX/XI/LQ/77639624/home-decor-wooden-items.jpg',
                          'https://www.goindigo.in/content/dam/indigov2/6e-website/indigo-social.jpg',
                          'https://img.freepik.com/premium-vector/daily-deals-day-with-decorative-lettering-text-style-label-hand-drawn-illustration_2175-10357.jpg'
                        ];

                        List<String> captions = [
                          'Home Decor',
                          'Indigo Flights',
                          'Deal of the Day'
                        ];

                        List<String> subtitle = [
                          'Min 70% Offer',
                          'Starting 1,299',
                          'Upto 60% Off'
                        ];

                        return Column(
                          children: [
                            Container(
                              height: 100.0,
                              width: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(imageUrls[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              captions[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
                  const Text("Sponsored",style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10.0,),
                  Container(
                      height: 160,
                      width: double.infinity,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: (itemWidth / 350),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> imageUrls = [
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRu9Ig60OfoKR8ERvsFHC3P2oRPGqGN1CbUJw&usqp=CAU',
                            'https://c.ndtvimg.com/2019-07/12b1cgb_axis-bank-flipkart-credit-card-axis-bank-website_625x300_12_July_19.jpg',
                            'https://images.moneycontrol.com/static-mcnews/2020/02/SBI_Card_SBICard-770x433.jpg'
                          ];

                          List<String> captions = [
                            'Get Metal Card',
                            'Enjoy Benifits',
                            'Enjoy 10x Rewards'
                          ];

                          List<String> subtitle = [
                            'Apply Now',
                            'Apply Now',
                            'Apply Now'
                          ];

                          return Column(
                            children: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrls[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                captions[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
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
                  // const SizedBox(height: 10.0,),
                  Container(
                      height: 160,
                      width: double.infinity,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: (itemWidth / 350),
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          List<String> imageUrls = [
                            'https://images.ctfassets.net/uwf0n1j71a7j/2IoYJVQ6vRsSlDNhcjRXJw/3687025d6a1832c77ad91bec1b04db5d/hero-bikes.png',
                            'https://bd.gaadicdn.com/upload/modellogo/64afb0b239cd1.jpg',
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRh-USO58FNyoBZ6xQDAQ8AHWesRUGYntB5gw&usqp=CAU'
                          ];

                          List<String> captions = [
                            'Upto 10,000* Off',
                            'Upto 13,000* Off',
                            'Upto 22,000* Off'
                          ];

                          List<String> subtitle = [
                            'Sale is Live',
                            'Sale is Live',
                            'Sale is Live'
                          ];

                          return Column(
                            children: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrls[index]),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                captions[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
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
                ],
              ),
            )
          ],
        ),

      ),
    );
  }

}

