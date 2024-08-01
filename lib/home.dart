import 'package:c11_exam_sun_online/colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class home extends StatefulWidget {
  static const String routeName= 'Home';
   home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  int _currentCarouselIndex = 0;

  final List<String> imgList = [
    'assets/images/awl sora 400x600.jpg',
    'assets/images/secphoto.png',
  ];

  List<String> categories = [
    'Art',
    'Business',
    'comedy',
    'drama',
  ];
  final List<String> bestseller = [
    'assets/images/lastphoto.png',
    'assets/images/lastphoto.png',
  ];

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentCarouselIndex = index;
    });
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            elevation: 0,
            toolbarHeight: 90,
            leading:
            Padding(
              padding: const EdgeInsets.only(left: 13.0, top: 15.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/Logo_Small.png'), iconSize: 100,),
              ),
            ),
            title:
            Align(
             alignment: Alignment.bottomLeft,
             child: Padding(
               padding: const EdgeInsets.only(right: 16.0, top:25.0 ),
               child: RichText(text: TextSpan(
                   children: <TextSpan>[
                     TextSpan(
                       text: "Audi", style: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize: 24,
                       color: AppColor.primaryColor,
                     ),
                     ),
                     TextSpan(
                       text: "Book", style: TextStyle(
                       fontWeight: FontWeight.w200,
                       fontSize: 24,
                       color: AppColor.primaryColor,
                     ),
                     ),
                     TextSpan(
                       text: ".", style: TextStyle(
                       fontWeight: FontWeight.w700,
                       fontSize: 24,
                       color: Colors.orange,
                     ),
                     ),
                   ]
               )),
             ),
                ),
            backgroundColor: Colors.white,
            actions: [
              Align(
                alignment: Alignment.center,
                child: IconButton(onPressed: () {},
                    icon: Icon(Icons.settings_outlined,
                      color: Color.fromRGBO(72, 56, 209, 1), size: 35,)),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: AppColor.primaryColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,weight: 900),
                label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search),
                label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.article_outlined,),
                label: "Library"),
          ],
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text("Categories",
                      style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),
                    Spacer(),
                    Text("see more",
                      style: GoogleFonts.poppins(color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),),

                  ],

                ),
              ),
              Container(
                height: 100,
                child: Expanded(
                  child:
                  Row(
                    children: [
                      Expanded(
                        child: ListView.builder(scrollDirection: Axis.horizontal,
                          itemCount: categories.length, itemBuilder:
                              (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 13.0),
                                  padding: const EdgeInsets.all(19.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(17.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      categories[index],
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),),),
                              ],
                            );


                          },

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text("Recommended for you ",
                      style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),
                    Spacer(),
                    Text("see more",
                      style: GoogleFonts.poppins(color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),),

                  ],

                ),
              ),

              Column(
                children: [
                  CarouselSlider(
                    items: imgList.map((item) {
                      return   Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(  image: DecorationImage(
                           image: AssetImage(item),

                               fit: BoxFit.cover,
                          ),
                      ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.7,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      //enlargeFactor: 0.3,
                      onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,

                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text("Best Seller",
                      style: GoogleFonts.poppins(color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),),
                    Spacer(),
                    Text("see more",
                      style: GoogleFonts.poppins(color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),


                  ],

                ),
              ),
              Column(
                children: [
                  CarouselSlider(
                    items: bestseller.map((item) {
                      return   Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(  color: Colors.grey[300], // Grey background color
                          borderRadius: BorderRadius.circular(8.0),
                        ),


                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  item,
                                  width: 120, // Width of the image
                                  height: 150, // Height of the image
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0), // Space between image and text
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Light Mage',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ),
                                    SizedBox(width: 30.0,),
                                    Text(
                                      'Laurie Forest',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.grey[400],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      //enlargeFactor: 0.3,
                      onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,

                    ),
                  )
                ],
              ),




            ],

          ),
        ),
      );
    }

}
