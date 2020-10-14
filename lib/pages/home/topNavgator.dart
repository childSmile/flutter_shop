import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class TopNavigator extends StatelessWidget {

  final List navigatorList = [
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'白酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'啤酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'美食',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'葡萄酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'饮料',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'白酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'啤酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'美食',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'葡萄酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'饮料',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'白酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'啤酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'美食',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'葡萄酒',
    },
    {'img':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597721802984&di=59fc64f157b9b94ae4e74ac04ae078d5&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D97183707%2C2420216808%26fm%3D214%26gp%3D0.jpg',
      'title':'饮料',
    },
  ];

  Widget _gradViewItem(BuildContext context,item) {
    return InkWell(
      onTap: (){print('点击了导航');},
      child: Column(
        children: [
          Image.network(item['img'],width: ScreenUtil().setWidth(95),height: ScreenUtil().setHeight(95),),
          Text(item['title'],style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    if(navigatorList.length > 10) {
      navigatorList.removeRange(10, navigatorList.length);
    }

    return Container(
      height: ScreenUtil().setHeight(320),
      color: Colors.white,
      padding: EdgeInsets.all(3),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4),
        children: navigatorList.map((item){
          return _gradViewItem(context, item);
        }).toList(),
      ),
    );
  }
}