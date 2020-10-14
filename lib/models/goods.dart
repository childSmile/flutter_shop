class Goods {

  String goodId;
  String img;
  String name;
  int price;
  int originPrice;
  int currentPrice;
  List cs = [];

  Goods({this.goodId,this.img,this.name,this.price,this.originPrice,this.currentPrice,this.cs});

//  factory Goods.fromJson(Map<String, dynamic> json) {
//    return Goods(goodId: json['goodId'], img: json['img'], name: json['name'],
//        price: json['price'], originPrice: json['originPrice'], currentPrice: json['currentPrice'],
//    cs:json['cs']);
//  }


}

class CatregoryModel {
  String name;
  int type;
  List list = [];
  CatregoryModel({this.name,this.type,this.list});
}


class CarInfoModel {
  String goodsId;
  String goodsName;
  int count;
  int price;
  String images;
  CarInfoModel({this.goodsId,this.goodsName,this.count,this.price,this.images});


  factory CarInfoModel.formJson(dynamic json) {
    return CarInfoModel(
      goodsId: json['goodsId'],
      goodsName: json['goodsName'],
      count: json['count'],
      price: json['price'],
      images: json['images'],
    );
  }

  Map<String ,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic> ();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['count'] = this.count;
    data['price'] = this.price;
    data['images'] = this.images;

    return data;

  }

}