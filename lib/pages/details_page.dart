import 'package:flutter/material.dart';

import '../models/goods.dart';

import 'package:provide/provide.dart';
import '../provide/home_good.dart';

import '../pages/details_page/details_top_area.dart';
import '../pages/details_page/details_tabbar.dart';
import '../pages/details_page/details_web.dart';

import '../pages/details_page/details_bottom.dart';


class DetailsPage extends StatefulWidget {

  final  good;
  DetailsPage({this.good});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeSelectGoodProvide>(
      builder: (context,child,data){
        return Scaffold(
          appBar: AppBar(
            title: Text(data.selectGood.name),
          ),
          body:Stack(
            children: [
              Container(
                child: ListView(
                  children: [
                    DetailsTopArea(),
                    DetailsExplain(),
                    DetailsTabbar(),
                    DetailsWeb()

                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: DetailsBottom(),
//              child: Text('333'),

              )
            ],
          ),
          


        );
      },
    );
  }
}




