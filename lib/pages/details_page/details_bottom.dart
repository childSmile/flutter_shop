import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../provide/car.dart';
import 'package:provide/provide.dart';
import '../../provide/home_good.dart';
import '../../routers/application.dart';
import '../car_page.dart';



class DetailsBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsInfo = Provide.value<HomeSelectGoodProvide>(context).selectGood;
    var goodsId = goodsInfo.goodId;
    var goodsName = goodsInfo.name;
    var count = 1;
    var price = goodsInfo.currentPrice;
    var images = goodsInfo.img;

    print('select -- name ${goodsName}');


    return Container(
      height: ScreenUtil().setHeight(90),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        children: [
          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(150),
              alignment: Alignment.center,
              child: Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.red,
              ),
            ),
            onTap: () async {
              print('in car');
//              Application.router.navigateTo(context, '/car_detail');
              await Provide.value<CarProvide>(context).getCarList();
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return CarPage();
            }));
            },
          ),

          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(300),
              alignment: Alignment.center,
              color: Colors.green,
              child:Text('加入购物车',
                style: TextStyle(color: Colors.white),),
            ),
            onTap: () async {
              print(' add in car');
              await Provide.value<CarProvide>(context).save(goodsId, goodsName, count, price, images);
            },
          ),


          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(300),
              alignment: Alignment.center,
              color: Colors.red,
              child: Text('立即购买',
                  style: TextStyle(color: Colors.white),),

            ),
            onTap: () async {
              print('clear car');
              await Provide.value<CarProvide>(context).remove();
            },
          ),
        ],
      ),
    );
  }
}
