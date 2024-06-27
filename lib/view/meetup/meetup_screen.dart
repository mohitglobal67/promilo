import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promilo/config/color/color.dart';
import 'package:promilo/config/textstyle/text_style.dart';
import 'package:promilo/utils/routes/routes_name.dart';
import 'package:promilo/widget/home_banner.dart';
import 'package:promilo/widget/stack_image.dart';

class MeetupScreen extends StatefulWidget {
  const MeetupScreen({super.key});

  @override
  _MeetupScreenState createState() => _MeetupScreenState();
}

class _MeetupScreenState extends State<MeetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        title: Text(
          'Individual Meetup',
          style: h2TextStyle(AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: const Icon(Icons.mic),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomCarouselSlider(),
              Text(
                'Trending Popular People',
                style: h2TextStyle(AppColors.blackColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 170.h,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 280.w,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                dense: true,
                                contentPadding: EdgeInsets.only(
                                  left: 10.0.r,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.blackColor,
                                  radius: 20.r,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    radius: 19.0.r,
                                    child: const Icon(Icons.macro_off),
                                  ),
                                ),
                                title: Text(
                                  "Author",
                                  style: textRegular(AppColors.blackColor),
                                ),
                                subtitle: Text(
                                  "1080 Meetups",
                                  style: text2Regular(AppColors.blackColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 15.r, right: 15.r),
                                child: Container(
                                  color: Colors.black,
                                  height: 1.h,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              buildStackedImages(),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 100.w,
                                    height: 35.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.primarymaincolor,
                                      borderRadius: BorderRadius.circular(8.r),

                                      // border: Border.all(width: 2)
                                    ),
                                    child: Center(
                                      child: Text(
                                        'See more',
                                        style:
                                            text2Regular(AppColors.whiteColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(height: 10.h),
              Text(
                'Top Trending Meetups',
                style: h2TextStyle(AppColors.blackColor),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 180.h,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.details,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.r),
                          height: 180.h,
                          width: 180.w,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Image.asset(
                                "assets/images/instagram.png",
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                  child: Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.r))),
                                child: Center(
                                    child: Text(
                                  "0${index + 1}",
                                  style: h1TextStyle(AppColors.blackColor),
                                )),
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStackedImages({
    TextDirection direction = TextDirection.ltr,
  }) {
    final double size = 50.r;
    final double xShift = 16.r;
    final urlImages = [
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1616766098956-c81f12114571?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    ];

    final items = urlImages.map((urlImage) => buildImage(urlImage)).toList();

    return StackedWidgets(
      direction: direction,
      items: items,
      size: size,
      xShift: xShift,
    );
  }

  Widget buildImage(String urlImage) {
    final double borderSize = 5.r;

    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        //  color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildExpandedBox({
    required List<Widget> children,
    required Color color,
  }) =>
      Expanded(
        child: Container(
          color: color,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      );
}
