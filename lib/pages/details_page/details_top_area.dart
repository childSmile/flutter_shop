import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provide/provide.dart';
import '../../provide/home_good.dart';

import '../../models/goods.dart';


class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeSelectGoodProvide>(
      builder: (context, child, data) {
        Goods good = data.selectGood;
        if (good != null) {
          return Container(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  _goodsImage(good.img),
                  _goodsName(good.name),
                  _goodsNum(good.currentPrice.toString()),
                  _goodsPrice(good),

                ],
              ),
            ),
          );
        } else {
          return Text('loading');
        }
      },
    );
  }

  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
    );
  }

  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 8.0,),
      width: ScreenUtil().setWidth(750),
      child: Text(
        num,
        style: TextStyle(color: Colors.black12),
      ),
    );
  }

  Widget _goodsPrice(Goods g) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8),
      child: Row(
        children: [
          Text(
            '¥${g.currentPrice.toString()}',
            style: TextStyle(fontSize: ScreenUtil().setSp(50),color: Colors.pink),
          ),

          Text(
            '市场价${g.originPrice.toString()}',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.black26,
                decoration: TextDecoration.lineThrough)
          ),

        ],
      ),
    );
  }
  
}


class DetailsExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
      margin: EdgeInsets.only(top: 10),
      child: Text(
            '说明： > 极速送达 > 正品保证',
            style: TextStyle(
                color:Colors.red,
                fontSize: ScreenUtil().setSp(25)
            ),
      ),
    );
  }
}
