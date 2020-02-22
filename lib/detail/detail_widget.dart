import 'package:flutter/cupertino.dart';
import 'package:flutter_drag_scale/core/drag_scale_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pocket_lite/model/share.dart';

class DetailWidget extends StatelessWidget {
  List<String> urls; //来自网络的url
  int type; //来自收藏，或者是分享

  DetailWidget(this.urls, this.type) : super();

  @override
  Widget build(BuildContext context) {
    return Swiper(
        itemBuilder: (context, index) {
          return DragScaleContainer(
            doubleTapStillScale: true,
            child: Image.network(urls[index]),
          );
        },
        itemCount: urls.length,
        autoplay: false,
        loop: false);
  }
}
