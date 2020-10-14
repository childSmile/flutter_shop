import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/home_good.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/webview.dart';

class DetailsWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<HomeSelectGoodProvide>(

      builder: (context,child,data){
        return Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(800),
            child: Text(data.current.toString()),
        );
      },
    );
  }
}
