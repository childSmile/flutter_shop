import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
//import 'package:flutter_app_shop/config/httpHeaders.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_app_shop/pages/home/recommendList.dart';
import 'package:flutter_app_shop/pages/home/floorContent.dart';
import 'package:flutter_app_shop/pages/home/topNavgator.dart';
import '../routers/application.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{


  @override
  bool get wantKeepAlive => true;

  TextEditingController typeController;

  String showText;

  List <String> imgList =[
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597666813189&di=1350022392061a44746e0ab269215578&imgtype=0&src=http%3A%2F%2Fbbsfiles.vivo.com.cn%2Fvivobbs%2Fattachment%2Fforum%2F201610%2F10%2F223520gj6otfv9t51t9oi9.jpg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597666813188&di=c3a403df317af979c442fef6362f950d&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201807%2F25%2F20180725102730_RvjTV.thumb.224_0.jpeg',
    'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2460867577,2160624644&fm=26&gp=0.jpg',
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    print('我打印了哈哈哈哈哈');

    showText = '欢迎来到美好人间';

    typeController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: new AppBar(
        title: new Text("百姓生活+"),
      ),

      body:SingleChildScrollView(
        
        child: Column(
          children: [
            SwiperDiplay(swiperDataList: imgList,),
            TopNavigator(),
            LeaderPhone(leaderImage: imgList.first,leaderPhone: '12345',),
            Recommend(recommendList: recommendLists,),
            FloorTitle(pic_address: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597740832287&di=473e88dbe1fc3d83a06c8fadb24da70a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201507%2F06%2F20150706081735_r4vBV.jpeg',),
            FloorContent(floorGoodslist: floorGoods),

          ],
        ),
      )

    );

  }

  void _choiceAcrion() {
//    if (typeController.text.toString() == '') {
//      showDialog(
//          context: context,
//          builder: (context) => AlertDialog(
//                title: Text('美女类型不能为空'),
//              ));
//    } else {
//      //  模拟网络请求 返回数据后显示
//      getHttp(typeController.text.toString()).then((value) => {
//            setState(() {
//              showText = value;
//            })
//          });
//    }
    ;
  }

//  void getHttp() async {
//    try{
//      Response response;
//      var data = {'name':'name'};
//      response = await Dio().get('your_url',queryParameters: data);
//
//      return print(response);
//
//    }catch(e){
//      return print(e);
//    }
//  }

//  Future getHttp(String typeText) async {
//    try {
//      print('222222');
//      Response response;
////      var data = {'name': 'name'};
////      response = await Dio().get(
////        'url',
////        queryParameters: data
////      );
//
//      Dio dio = Dio();
////      dio.options.headers = httpHeaders;
//      response = await dio.get('https://www.jikexueyuan.com/');
//      print(response);
//      return response;
//    } catch (e) {
//      return print(e);
//    }
//  }
}


class SwiperDiplay extends StatelessWidget {
  final List swiperDataList;
  SwiperDiplay({Key key,this.swiperDataList}):super(key:key);


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334,)..init(context);

    return Container(
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
          itemCount: swiperDataList.length,
         itemBuilder: (context,index){
            return Image.network(
              '${swiperDataList[index]}',
              fit: BoxFit.fill,
            );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}




class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;
  LeaderPhone({Key key,this.leaderImage,this.leaderPhone}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: InkWell(

        onTap: _launchURL,
        child: Image.network(leaderImage,height: ScreenUtil().setHeight(100),),
      ),
    );
  }

  void _launchURL() async{
    String url = 'tel:'+leaderPhone;
    if(await canLaunch(url)){
      await launch(url);
    }else {
      throw 'Could not lan=unch $url';
    }
  }
}






