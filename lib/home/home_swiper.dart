//轮播
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeSwiper extends StatelessWidget {
  HomeSwiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Swiper(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Image.asset("images/banner_1.webp", fit: BoxFit.fill);
          } else {
            return Image.asset("images/banner_3.webp", fit: BoxFit.fill);
          }
        },
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsets.all(5.0),
        ),
      ),
    );
  }
}
