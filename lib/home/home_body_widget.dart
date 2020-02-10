import 'package:flutter/material.dart';
import 'package:pocket_lite/log_util.dart';

class HomeBody extends StatefulWidget {
  List listData;
  ItemWidgetBuild itemWidgetCreator; //接口
  HeaderWidgetBuild headerCreator;

  HomeBody(List this.listData,
      {Key key, this.itemWidgetCreator, this.headerCreator})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeBodyWidget();
  }
}

//接口
typedef HeaderWidgetBuild = Widget Function(BuildContext context, int position);

typedef ItemWidgetBuild = Widget Function(BuildContext context, int position);

//State里可以直接拿到Widget的数据
class HomeBodyWidget extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildItemWidget(context, index);
      },
      itemCount: _getListCount(),
    );
  }

  int _getListCount() {
    int itemCount = widget.listData.length;
    return getHeaderCount() + itemCount;
  }

  int getHeaderCount() {
    int headerCount = widget.headerCreator == null ? 0 : 1;
    return headerCount;
  }

  Widget _headerItemWidget(BuildContext context, int index) {
    if (widget.headerCreator != null) {
      return widget.headerCreator(context, index);
    } else {
      return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Text("Header Row $index")),
        onTap: () {
          print('header click $index --------------------');
        },
      );
    }
  }

  Widget buildItemWidget(BuildContext context, int index) {
    if (index < getHeaderCount()) {
      return _headerItemWidget(context, index);
    } else {
      int pos = index - getHeaderCount();
      return _itemBuildWidget(context, pos);
    }
  }

  Widget _itemBuildWidget(BuildContext context, int index) {
    if (widget.itemWidgetCreator != null) {
      return widget.itemWidgetCreator(context, index);
    } else {
      return new GestureDetector(
        child: new Padding(
            padding: new EdgeInsets.all(10.0), child: new Text("Row $index")),
        onTap: () {
          print('click $index --------------------');
        },
      );
    }
  }
}
