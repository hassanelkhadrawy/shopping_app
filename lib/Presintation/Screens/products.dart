import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_app/Data/Models/Category/category_model.dart';
import 'package:shopping_app/Data/Models/Home/home_model.dart';
import 'package:shopping_app/Data/Models/Home/shop.dart';
import 'package:shopping_app/Data/cached_helper.dart';
import 'package:shopping_app/Logic/Cubit/ShoppingScreen/shopping_screen_cubit.dart';
import 'package:shopping_app/constants/Colors/colors.dart';
import 'package:shopping_app/constants/Componant/componants.dart';
import 'package:shopping_app/constants/Strings/strings.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingScreenCubit, ShoppingScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShoppingScreenCubit.get(context);
          return BlocConsumer<ShoppingScreenCubit, ShoppingScreenState>(
            listener: (context, state) {},
            builder: (context, state) {
              return ConditionalBuilder(
                condition: cubit.homeModel != null,
                builder: (context) => BuildSlider(cubit.homeModel!,cubit.categoryModel!),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              );
            },
          );
        });
  }

  Widget BuildSlider(HomeModel model,CategoryModel categoryModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: model.data!.banners!
                    .map(
                      (e) => Image(
                        image: NetworkImage('${e.image}'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                  height: 300,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories", style: TextStyle(fontSize: 20)),
                  Container(
                    height: 120,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => BuildCategoryItem(ShoppingScreenCubit.get(context).categoryModel!.data!.data![index]),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 10,
                            ),
                        itemCount:categoryModel.data!.data!.length),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("New Products", style: TextStyle(fontSize: 20)),
                  Container(
                    color: Colors.grey[300],
                    child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.7,
                        children: List.generate(
                            model.data!.products!.length,
                            (index) =>
                                BuildProductItem(model.data!.products![index]))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget BuildProductItem(ProductsItems productmodel) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(productmodel.image),
              height: 200,
              width: double.infinity,
            ),
            if (productmodel.discount != 0)
              Container(
                // width: 70,
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.red,
                child: Text(
                  "Discount",
                  style: TextStyle(color: Colors.white),
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                productmodel.name,
                style: TextStyle(fontSize: 17, height: 1.4),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(children: [
                Text(
                  '${productmodel.price}',
                  style: TextStyle(fontSize: 15, color: defaultColor),
                ),
                SizedBox(
                  width: 5.0,
                ),
                if (productmodel.discount != 0)
                  Text(
                    '${productmodel.oldPrice}',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                Spacer(),

                CircleAvatar(

                  backgroundColor: Colors.grey,
                  child:IconButton(
                    onPressed: (){
                      print(UserToken);
                    },
                    icon:Icon(Icons.favorite_border_outlined,color: Colors.white,)) ,
                )
              ])
            ],
          ),
        ),
      ],
    ),
  );
}

Widget BuildCategoryItem(CategoryItem model) {
  return Stack(
    alignment: AlignmentDirectional.bottomStart,
    children: [
      Image(
        image: NetworkImage(
            model.image),
        height: 120,
        width: 120,
        fit: BoxFit.cover,
      ),
      Container(
        width: 120,
        color: Colors.black.withOpacity(.6),
        child: Text(
          "${model.name}",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      )
    ],
  );
}
