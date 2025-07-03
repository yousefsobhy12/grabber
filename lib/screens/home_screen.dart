import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grabber/models/category_model.dart';
import 'package:grabber/models/fruits_model.dart';
import 'package:grabber/widgets/custom_fruit_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> sliders = [
    'assets/images/sliders/slider1.png',
    'assets/images/sliders/slider2.png',
    'assets/images/sliders/slider3.png',
  ];
  List<CategoryModel> categories = [
    CategoryModel(
      image: 'assets/images/categories/fruits.png',
      title: 'Fruits',
    ),
    CategoryModel(
      image: 'assets/images/categories/milk.png',
      title: 'Milk & egg',
    ),
    CategoryModel(
      image: 'assets/images/categories/beverages.png',
      title: 'Beverages',
    ),
    CategoryModel(
      image: 'assets/images/categories/laundry.png',
      title: 'Laundry',
    ),
    CategoryModel(
      image: 'assets/images/categories/vegetables.png',
      title: 'Vegetables',
    ),
  ];
  List<FruitsModel> fruits = [
    FruitsModel(
      image: 'assets/images/fruits/banana.png',
      title: 'Banana',
      rate: 4.8,
      rateCount: 287,
      price: 3.99,
    ),
    FruitsModel(
      image: 'assets/images/fruits/pepper.png',
      title: 'Pepper',
      rate: 4.8,
      rateCount: 287,
      price: 3.99,
    ),
    FruitsModel(
      image: 'assets/images/fruits/orange.png',
      title: 'Orange',
      rate: 4.8,
      rateCount: 287,
      price: 2.99,
    ),
  ];
  List basketList = [];
  void increment(FruitsModel fruit) {
    if (!basketList.contains(fruit)) {
      basketList.add(fruit);
    }
  }

  void decrement(FruitsModel fruit) {
    if (basketList.contains(fruit)) {
      basketList.remove(fruit);
    }
  }

  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/images/icons/motor.svg', width: 27),
            SizedBox(width: 12),
            Text(
              '61 Hopper street..',
              style: GoogleFonts.inter(fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 12),
            Icon(Icons.keyboard_arrow_down_rounded, size: 30),
            Spacer(),
            SvgPicture.asset('assets/images/icons/basket.svg'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            CarouselSlider.builder(
              itemCount: sliders.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset(sliders[index]);
              },
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.75,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),

            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  return Column(
                    children: [
                      Container(
                        height: 70,
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade200,
                        ),
                        child: Image.asset(categories[index].image),
                      ),
                      Text(
                        categories[index].title,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff5A5555),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fruits',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0CA201),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(
                  children: List.generate(fruits.length, (index) {
                    return CustomFruitWidget(
                      image: fruits[index].image,
                      title: fruits[index].title,
                      rate: fruits[index].rate,
                      rateCount: fruits[index].rateCount,
                      price: fruits[index].price,
                      increase: () {},
                      decrease: () {},
                    );
                  }),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff0CA201),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    spacing: 6,
                    children: List.generate(3, (index) {
                      return CircleAvatar(
                        child: Image.asset(
                          'assets/images/fruits/banana.png',
                          width: 35,
                        ),
                      );
                    }),
                  ),
                  VerticalDivider(
                    color: Colors.white,
                    indent: 16,
                    endIndent: 16,
                  ),
                  Text(
                    'View Basket',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/images/icons/basket.svg',
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ====== Snack-Bar ======

                        // final snackBar = SnackBar(
                        //   content: Text('Snack-Bar'),
                        //   behavior: SnackBarBehavior.floating,
                        //   duration: Duration(days: 1),
                        //   action: SnackBarAction(
                        //     label: 'Dismiss',
                        //     onPressed: () {
                        //       ScaffoldMessenger.of(
                        //         context,
                        //       ).hideCurrentSnackBar();
                        //     },
                        //   ),
                        // );
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);