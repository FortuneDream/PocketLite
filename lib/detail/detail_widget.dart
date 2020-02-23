import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/core/drag_scale_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetailWidget extends StatelessWidget {
  List<String> urls; //来自网络的url
  int type; //来自收藏，或者是分享

  DetailWidget(this.urls, this.type) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        child: Swiper(
            itemBuilder: (context, index) {
              return DragScaleContainer(
                  doubleTapStillScale: true,
                  child: FadeInImage.assetNetwork(
                      placeholder: "images/loading_bg.png",
                      image: urls[index]));
            },
            itemCount: urls.length,
            autoplay: false,
            loop: false,
            pagination: SwiperPagination(
              margin: EdgeInsets.all(5.0),
            )));
  }
}
