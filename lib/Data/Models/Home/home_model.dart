class HomeModel{
 late bool status;
  HomeModelData? data;
 HomeModel.fromjson(Map<String,dynamic> json){
   this.status=json['status'];
   this.data= HomeModelData.fromjson(json['data']) ;

 }
}
class HomeModelData{
  List<BannersItems>? banners;
    List<ProductsItems>? products;

   HomeModelData.fromjson(Map<String,dynamic> json){
     this.banners=List<BannersItems>.from(json['banners'].map((json) => BannersItems.fromjson(json)));
     this.products=List<ProductsItems>.from(json['products'].map((json) => ProductsItems.fromjson(json)));

     // json['banners'].forEach((element){
     //   banners!.add(element);
     // });
     // json['products'].forEach((element){
     //   products!.add(element);
     // });


   }
}
class BannersItems{
late int id;
 late String image;
 dynamic? category;
dynamic? product;
BannersItems.fromjson(Map<String,dynamic> json){
  this.id=json['id'];
  this.image=json['image'];
  this.category=json['category'];
  this.product=json['product'];


}
}
class ProductsItems{
 late int id;
 late dynamic price;
 late dynamic oldPrice;
 late dynamic discount;
 late String image;
 late String name;
 late String description;
 late bool in_favorites;
 late bool in_cart;

 ProductsItems.fromjson(Map<String,dynamic> json){
   this.id=json['id'];
   this.price=json['price'];
   this.oldPrice=json['old_price'];
   this.discount=json['discount'];
   this.image=json['image'];
   this.name=json['name'];
   this.description=json['description'];
   this.in_favorites=json['in_favorites'];
   this.in_cart=json['in_cart'];



 }
}