import 'package:flutter/material.dart';
import '../provide/car.dart';
import 'package:provide/provide.dart';
import '../models/goods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Provide<CarProvide>(builder: (context, child, data) {
      List car = data.carList;
      if (car.length > 0) {
        return Container(
          child: ListView(
            children: car.map((e) {
              return Container(
                child: Row(
                  children: [
                    _goodsImage(e),
                    Column(
                      children: [
                        _goodsName(e),
                        _goodsPrice(context, e),
                        _buttonWidget(context, e)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        );
      } else {
        return Text('loading');
      }
    }));
  }

  Widget _buttonWidget(context, e) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(

              child: Text(
                '-',
                style: TextStyle(
                    color: Colors.pink, fontSize: ScreenUtil().setSp(60)),
              ),
              onTap: () async {
                await Provide.value<CarProvide>(context).delete(e);
              }),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.only(top: 5),
//            color: Colors.yellow,
            child: Text('${e.count}',
                style: TextStyle(
                    color: Colors.black26, fontSize: ScreenUtil().setSp(30))),
          ),
          InkWell(
              child: Text(
                '+',
                style: TextStyle(
                    color: Colors.pink, fontSize: ScreenUtil().setSp(60)),
              ),
              onTap: () async {
                await Provide.value<CarProvide>(context).add(e);
              })
        ],
      ),
    );
  }

  Widget _goodsImage(m) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(m.images),
    );
  }

  Widget _goodsName(m) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        m.goodsName,
        maxLines: 2, //最多显示2行
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(context, m) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: [
          Text(
            '价格¥${m.price * m.count}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text('单价¥${m.price}',
              style: TextStyle(
                color: Colors.black26,
              )),
        ],
      ),
    );
  }
}
