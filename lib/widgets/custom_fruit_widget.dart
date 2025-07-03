import 'dart:developer';

import 'package:add_to_cart_button/add_to_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFruitWidget extends StatelessWidget {
  const CustomFruitWidget({
    super.key,
    required this.image,
    required this.title,
    required this.rate,
    required this.rateCount,
    required this.price,
    required this.increase,
    required this.decrease,
  });
  final String image;
  final String title;
  final double rate;
  final int rateCount;
  final double price;
  final Function() increase;
  final Function() decrease;
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: Color(0xffFEF7FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(image, width: 140),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: AddToCartCounterButton(
                  initNumber: 0,
                  minNumber: 0,
                  maxNumber: 10,
                  increaseCallback: increase,
                  decreaseCallback: decrease,
                  counterCallback: (int count) {
                    log('Current count: $count');
                  },
                  backgroundColor: Colors.white,
                  buttonFillColor: Colors.white,
                  buttonIconColor: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Row(
                  spacing: 6,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/icons/star.svg'),
                    Text(
                      '$rate ($rateCount)',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                Text(
                  '\$$price',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
