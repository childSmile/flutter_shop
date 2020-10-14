
import 'package:flutter/material.dart';

import 'package:flutter_app_shop/models/goods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_app_shop/routers/application.dart';

import '../../provide/home_good.dart';
import 'package:provide/provide.dart';


class FloorContent extends StatelessWidget {


//  dynamic onTap;

  final List floorGoodslist;
//  Goods selectGood;

//  FloorContent({this.floorGoodslist,this.onTap,this.selectGood});

  FloorContent({this.floorGoodslist});


  Widget _goodsItem(BuildContext context,Goods goods){
    return Container(

      child: InkWell(
        child: Image.network(goods.img,width: ScreenUtil().setWidth(350.0),),
        onTap:(){
          print('eeeeeee === ${goods.name}');
          Application.router.navigateTo(context, '/detail');
          
          Provide.value<HomeSelectGoodProvide>(context).getGood(goods);
        },
      ),
    );
  }

  Widget _firstRow(context){
    return Row(
      children: [
        _goodsItem(context,floorGoodslist[0]),
        Column(
          children: [
            _goodsItem(context,floorGoodslist[1],),
            _goodsItem(context,floorGoodslist[2]),
          ],
        )
      ],
    );

  }

  Widget _otherRow(context){
    return Row(
      children: [
        _goodsItem(context,floorGoodslist[3]),
        _goodsItem(context,floorGoodslist[4]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          _firstRow(context),
          _otherRow(context),
        ],
      ),
    );
  }
}


class FloorTitle extends StatelessWidget {
  final String pic_address;
  FloorTitle({this.pic_address});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(pic_address),
    );
  }
}


List<Goods> floorGoods = [

  Goods(
    img: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1019277884,1784091989&fm=26&gp=0.jpg',
     name: '白酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
    goodId: '1',
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '数码',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
    goodId: '2',
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '家电',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
    goodId: '3',
  ),


  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美食',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
    goodId: '4',
  ),



  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '葡萄酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
    goodId: '5',
  ),


  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美妆',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: mzs,
    goodId: '6',
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '啤酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
    goodId: '7',
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '饮料',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
    goodId: '8',
  ),


];



List cgs = [

  CatregoryModel(name: '名酒',list: gs),
  CatregoryModel(name: '宝丰'),
  CatregoryModel(name: '北京二锅头'),
  CatregoryModel(name: '五粮液'),
  CatregoryModel(name: '散白'),

];

List gs = [
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美妆',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '啤酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '饮料',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '啤酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '饮料',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '啤酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '饮料',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '啤酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '饮料',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
  ),



];


List mzs = [

  CatregoryModel(name: '精华水',list: mzgs),
  CatregoryModel(name: '保湿乳'),
  CatregoryModel(name: '粉底液'),
  CatregoryModel(name: '眼霜'),
  CatregoryModel(name: '面霜'),

  CatregoryModel(name: '面膜'),
  CatregoryModel(name: '防晒霜'),
  CatregoryModel(name: '眼影'),
  CatregoryModel(name: '隔离霜'),

];

List mzgs = [

  Goods(
    img: 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1019277884,1784091989&fm=26&gp=0.jpg',
    name: '白酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '数码',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
  ),

  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '家电',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
    cs: cgs,
  ),


  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美食',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),



  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '葡萄酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美食',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),



  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '葡萄酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美食',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),



  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '葡萄酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),
  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '美食',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),



  Goods(
    img: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
    name: '葡萄酒',
    price: 500,
    originPrice: 1000,
    currentPrice: 500,
//      list: categoris,
    cs: cgs,
  ),


];

