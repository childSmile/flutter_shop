import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app_shop/models/goods.dart';
import '../pages/home/floorContent.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import '../provide/category_goods_list.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'details_page.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../service/service_request.dart';

import '../provide/home_good.dart';
import '../routers/application.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Center(
        child: Row(
          children: [
            LeftCategoryNav(),
            Column(
              children: [
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
//  List list = ['名酒','宝丰','北京二锅头','舍得','大盘鸡杯','老村长','五粮液','茅台','散白'];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List goods = [];

//  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black12))),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: childCategory.childCategoryList.length,
              itemBuilder: (context, index) {
                return _rightInkWell(childCategory.childCategoryList,index);
              }),
        );
      },
    );
  }

  Widget _rightInkWell(list,index) {

    bool isClick = false;
    isClick = (Provide.value<ChildCategory>(context).childIndex) == index ? true : false;

    return InkWell(
      onTap: () {
//        setState(() {
//          currentIndex = index;
//        });
        Provide.value<ChildCategory>(context).changeChildIndex(index);
        _getGoodsList(index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          '${list[index].name}' ,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isClick == true ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }



  void _getGoodsList(type) {

//    print(Provide.value<ChildCategory>(context).childCategoryList);

    Future.delayed(Duration(microseconds: 500), () {

      setState(() {
        goods = Provide.value<ChildCategory>(context).childCategoryList[type].list;
        print('goods  + ${goods}');
      });

      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goods);
    });
  }
}

class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<Goods> list = [];
  List goods = [];
  var listIndex = 0;
  int category = 0;
  int smallType = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    list = floorGoods ;

    _getCategory();
  }

  void _getCategory() {
    //延时500毫秒执行 模拟网络请求
    Future.delayed(const Duration(milliseconds: 500), () {
      //延时执行的代码

      setState(() {
        //延时更新状态
        list = floorGoods;
      });

      Provide.value<ChildCategory>(context).getChildCategory(list.first.cs,category);
      _getGoodsList(category);
    });
  }

  void _getGoodsList(type) {

    Future.delayed(Duration(microseconds: 500), () {

      setState(() {
        goods = list[listIndex].cs[type].list;
        print('goods  + ${list}');
      });
      Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goods);
    });
  }

  //网络请求
//  void _getCategory() async {
//    var data = {};//参数
//    await request('url', data, RequestMethod.Get).then((val){
//      var response = val.decode(val.toString());
//      print('分类-- ${val}');
//    });
//  }

  Widget _leftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          category = index;
          listIndex = index;
        });

        var childCategoryList = list[index].cs;

        Provide.value<ChildCategory>(context)
            .getChildCategory(childCategoryList,listIndex);
        _getGoodsList(0);
      },
      child: Container(
        child: Text(
          list[index].name,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
          ),
        ),
        height: ScreenUtil().setHeight(80.0),
        padding: EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
            color: isClick ? Colors.black26 : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180.0),
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(color: Colors.black12, width: 1.0),
      )),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _leftInkWell(index);
          }),
    );
  }
}

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {


//  List<Goods> goods = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context,child,data) {
        if(data.goodsList.length > 0) {
          return Expanded(
            child: Container(
              width: ScreenUtil().setWidth(570),
              child: EasyRefresh(
                  child: ListView.builder(
                  itemCount: data.goodsList.length,
                  itemBuilder: (context, index) {
                    return _listWidget(context,data.goodsList, index);
                  }),

              ),
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.only(top: 100),
            child: Text('暂时没有数据'),
          );
        }
      },
    );
  }




  Widget _listWidget(context,list,index){
    return InkWell(
      onTap: (){
        print(index);

        Application.router.navigateTo(context, '/detail');
        Provide.value<HomeSelectGoodProvide>(context).getGood(list[index]);

//        Navigator.of(context).push(MaterialPageRoute(builder: (){
//          return DetailsPage(Provide.value<CategoryGoodsListProvide>(context).goodsList)[index]);
//        }))
//        Fluttertoast.showToast(
//          msg: '没有数据',
//          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
//          timeInSecForIosWeb: 1,
////          webBgColor: '#e74c3c',
//        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 5,bottom: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12)
          )
        ),
        child: Row(
          children: [
            _goodsImage(list,index),
            Column(
              children: [
                _goodsName(list,index),
                _goodsPrice(list,index)
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _goodsImage(list,index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.network(list[index].img),
    );
  }
  
  
  Widget _goodsName(list,index) {
    return Container (
      padding: EdgeInsets.all(5.0),
      width: ScreenUtil().setWidth(370),
      child: Text(
        list[index].name,
        maxLines: 2,//最多显示2行
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28)
        ),
      ),
    );
  }

  Widget _goodsPrice(goods,index){
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: ScreenUtil().setWidth(370),
      child: Row(
        children: [
          Text('价格¥${goods[index].currentPrice}',
          style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(30)),
          ),

          Text(
            '价格¥${goods[index].originPrice}',
            style: TextStyle(color: Colors.black26,decoration:TextDecoration.lineThrough)
          ),
        ],
      ),
    );
  }
}
