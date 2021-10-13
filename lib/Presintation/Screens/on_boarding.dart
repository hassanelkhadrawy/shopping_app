import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Data/cached_helper.dart';
import 'package:shopping_app/Data/Models/boarding_model.dart';
import 'package:shopping_app/Presintation/Screens/login_screen.dart';
import 'package:shopping_app/constants/Colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/Componant/componants.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  var boardingcontrolar = PageController();
  bool isLast = false;

  final List<Boarding>? boardinglist = [
    Boarding('assets/images/boarding_image.jpg', "title1", "body1"),
    Boarding('assets/images/boarding_image.jpg', "title2", "body2"),
    Boarding('assets/images/boarding_image.jpg', "title3", "body3"),
  ];

  void Submit({
  required context
}) async{
    await SharedPre.init();
    SharedPre.PutData(key: "onBoarding", value: true).then((value){
      print(value);
     if(value==true)NavigateToFinish(context: context,widget:LoginScreen());

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                children: [
                  Spacer(),
                  OutlinedButton(
                      onPressed: (){
                        Submit(context: context);

                      },
                      child: Text("Skip")),
                ],

              ),
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == boardinglist!.length -1){
                    isLast=true;

                  }else{
                    isLast=false;

                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardingcontrolar,
                itemBuilder: (context, index) => buildBoardItem(
                    context: context, model: boardinglist![index]),
                itemCount: boardinglist!.length,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingcontrolar,
                  count: boardinglist!.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      expansionFactor: 4,
                      spacing: 5),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    isLast?Submit(context: context):
                    boardingcontrolar.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardItem({required context, required Boarding model}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              '${model.image}',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.title}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.body}',
          ),
        ],
      );
}
