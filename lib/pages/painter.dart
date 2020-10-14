import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class BaseLineChart extends CustomPainter {

  //画图的笔
  Paint painter = Paint()
  ..strokeWidth = 1.2
  ..style = PaintingStyle.stroke;


  //画文字的笔
  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    maxLines: 1,
  );

  var width;
  var yTextwidth ;
  var unitWidth ;


  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint


   // [size]为父组件的尺寸 ,
    // 超过父组件的绘制内容都会被剪切掉

    Rect rect = Offset.zero & size;
    canvas.clipRect(rect);

    //设置背景颜色
    painter.color = Colors.white;
    painter.style = PaintingStyle.fill;
    canvas.drawRect(rect, painter);

    //根据副组件尺寸，确定自定义view的宽，文字大小
    width = size.width;
    yTextwidth = width / 7;
    unitWidth = (width - yTextwidth ) / 4;


    //绘制背景横线
    painter.strokeWidth = 1.2;
    painter.color = Colors.black12;

    final line_num = 5;
    final line_space = 40.0;
    final top = 100;

    for(int i = 0;i < line_num; i ++){
      //绘制横线
      //drawLine(起点坐标，重点坐标)
      canvas.drawLine(Offset(yTextwidth, i * line_space  + top), Offset((width - yTextwidth), i * line_space  + top), painter);
    }
    
    //最后一条线条较粗
    painter.strokeWidth = 1.4;
    painter.color = Colors.black45;
    
    canvas.drawLine(Offset(yTextwidth, (line_num - 1) * line_space + top), Offset((width - yTextwidth), (line_num - 1) * line_space + top), painter);


    //绘制文本X Y 以及标题

    //y轴标题
    textPainter.text = TextSpan(
      text: 'x',
      style: TextStyle(
        color: Colors.yellow,
        fontSize: ScreenUtil().setSp(20),
      )
    );

    textPainter.paint(canvas, Offset(0, 0));

    //


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


class PainterPage extends StatefulWidget {
  @override
  _PainterPageState createState() => _PainterPageState();
}

class _PainterPageState extends State<PainterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(painter: BaseLineChart(),),
    );
  }
}

