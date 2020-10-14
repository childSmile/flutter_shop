import 'package:flutter/material.dart';

import 'package:provide/provide.dart';
import '../provide/counter.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_calendar/mini_calendar.dart';

import '../service/dioRequest.dart';

import 'painter.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPage createState() => _MemberPage();
}

class _MemberPage extends State<MemberPage> {
  List list = ['个人信息', '我的设备', '账号设置', '退出登录'];
  List icons = [
    Icons.dashboard,
    Icons.data_usage,
    Icons.date_range,
    Icons.dehaze
  ];

  ScrollController _controller = ScrollController();

  String title = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.addListener(() {
      if (_controller.offset < 100) {
        setState(() {
          title = '';
        });
      } else {
        setState(() {
          title = '个人中心';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      controller: _controller,
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596452016492&di=bd5e9c2e0879583d932353b1c3ba53fe&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3D25b94920b2b7d0a27bc90495fbee760d%2F475b0930e924b899218c5caa6e061d950b7bf657.jpg',
              fit: BoxFit.cover,
            ),
            title: Text('${title}'),
          ),
        ),

//

        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return _item(index, context);
          }, childCount: list.length //50个列表项
                  ),
        ),
      ],
    );
  }

  Widget _item(index, context) {
    return InkWell(
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(icons[index]),
            ),
            Text(
              list[index],
              style: TextStyle(fontSize: ScreenUtil().setSp(30)),
            )
          ],
        ),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.only(topLeft: Radius.circular(index == 0 ? 50 : 0),topRight: Radius.circular(index == 0 ? 50 : 0)),
//          color: Colors.white
//        ),
      ),
      onTap: () {
        print('index== ${index}');
        if (index == 0) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PainterPage();
          }));
        } else if (index == 1) {
          DioUtils.requestHttp('/yhe/user/info',
              method: DioUtils.GET,parameters: {}, onSuccess: (data) {
            print('data --- ${data}');
          }, onError: (error) {
            print('error -- ${error}');
          });
        }
      },
    );
  }
}
