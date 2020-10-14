import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Recommend extends StatelessWidget {


  final List recommendList;
  Recommend({this.recommendList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }


  Widget _titleWidget(){
    return Container(

      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5,color: Colors.black12),
            top: BorderSide(width: 0.5,color: Colors.black12),
          )
      ),
      child: Text('商品推荐',style: TextStyle(color: Colors.pink),),
    );
  }

  Widget _recommendList(){
    return Container(

      height: ScreenUtil().setHeight(300),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context,index){
            return _item(index);
          }
      ),
    );
  }

  Widget _item(index){
    return InkWell (
      child: Container(
        width: ScreenUtil().setWidth(750.0/3),
        height: ScreenUtil().setHeight(250),
        padding: EdgeInsets.all(8.0),

        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: BorderSide(width: 0.5,color: Colors.black12)
            )
        ),

        child: Column(
          children: [
            Image.network(recommendList[index]['img'],),
            Container(
              child: Text(recommendList[index]['currentPrice'],style: TextStyle(fontSize: 16),),
              margin: EdgeInsets.only(top: 10),
            ),
            Text(recommendList[index]['originPrice'],
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,color: Colors.grey
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        print('select = ${index}');
      },
    );
  }
}

List recommendLists = [
  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},

  {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721801778&di=e9898cb92d26bbaa160a2b82a8e4524e&imgtype=0&src=http%3A%2F%2Fres.hpoi.net.cn%2Fgk%2Fpic%2Fs%2F2016%2F06%2Fdba338af8d444f87b11e266fc3d016f1.jpeg',
    'originPrice':'500',
    'currentPrice':'200'},


];