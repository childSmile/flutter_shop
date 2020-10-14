import 'package:flutter/material.dart';
import '../../provide/home_good.dart';

import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsTabbar extends StatelessWidget {

  List tabs = ['详情','评价','购买记录'];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Provide<HomeSelectGoodProvide>(
      builder: (context,child,data){

        currentIndex = data.current;
        return Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(

            children: tabs.map((title){
              int index = tabs.indexOf(title);
              return Container(
                width: ScreenUtil().setWidth(750.0/tabs.length),
                height:ScreenUtil().setHeight(80),
                child: _tabbar(context, title, tabs.indexOf(title) == currentIndex ? true : false, index),
              );
            }).toList(),
          ),

        );
      },
    );
  }

  Widget _tabbar(context,title,isSelcet,index) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: isSelcet == true ? Colors.pink : Colors.black12,
            ),
//
          ),
          color: Colors.white,
        ),

        child:Center(
            child:  Text(title,style: TextStyle(color: isSelcet == true ? Colors.pink : Colors.black),)
        ),
      ),

      onTap: (){
        Provide.value<HomeSelectGoodProvide>(context).changeLeftAngRight(index);
      },
    );
  }

}
