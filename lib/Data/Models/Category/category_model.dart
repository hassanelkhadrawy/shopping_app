class CategoryModel{
  bool? status;
  CategoryData? data;
CategoryModel.fromjson(Map<String,dynamic> json){
  this.status= json['status'];
  this.data=CategoryData.fromjson(json['data']) ;


}
}
class CategoryData{
 int? current_page;
 List<CategoryItem>? data;
CategoryData.fromjson(Map<String,dynamic> json){
  this.current_page= json['current_page'];
  this.data=List<CategoryItem>.from(json['data'].map((json) => CategoryItem.fromjson(json)));


}
}
class CategoryItem{
   int? id;
  late String name;
  late String image;
  CategoryItem.fromjson(Map<String,dynamic> json){
    this.id=json['id'];
    this.name=json['name'];
    this.image=json['image'];

  }
}