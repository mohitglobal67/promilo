import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promilo/config/color/color.dart';
import 'package:promilo/config/textstyle/text_style.dart';
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  List rating = [5, 5, 5, 3, 1];

  List bannerimages = [
    'assets/images/banner1.jpeg',
    'assets/images/banner2.jpeg',
    'assets/images/banner3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Description',
          style: h2TextStyle(AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 270.h,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  children: [
                    ImageSlideshow(
                        width: double.infinity,
                        indicatorRadius: 5.r,
                        indicatorPadding: 10.r,
                        indicatorBottomPadding: 20.r,
                        initialPage: 0,
                        indicatorColor: Colors.white,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {},
                        disableUserScrolling: false,
                        autoPlayInterval: 0,
                        height: 220.h,
                        isLoop: true,
                        children: List.generate(bannerimages.length, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(bannerimages[index]),
                                  fit: BoxFit.fill),
                            ),
                          );
                        })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.download),
                        const Icon(
                          Icons.bookmark_outline,
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_outline,
                              color: AppColors.blackColor),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star_outline,
                              color: AppColors.blackColor),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.share,
                              color: AppColors.blackColor),
                          onPressed: () async {
                            await Share.share(
                              'Check out this amazing content!',
                              subject: 'Promilo App',
                            );
                            // await Share.share('https://www.fluttercampus.com',
                            //     subject: 'Welcome Message');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 350.w,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.bookmark_outline,
                              color: AppColors.primarymaincolor),
                          onPressed: () {},
                        ),
                        Text(
                          '1034',
                          style: text2Regular(AppColors.blackColor),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_outline,
                              color: AppColors.primarymaincolor),
                          onPressed: () {},
                        ),
                        Text(
                          '1034',
                          style: text2Regular(AppColors.blackColor),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.r),
                          height: 25.h,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              for (int i = 0; i < rating.length; i++)
                                rating[i] == 5
                                    ? const Icon(Icons.star,
                                        size: 20, color: AppColors.starcolor)
                                    : rating[i] == 1
                                        ? Icon(
                                            Icons.star_half,
                                            size: 20.r,
                                            color: AppColors.whiteColor,
                                          )
                                        : Icon(Icons.star_half,
                                            size: 20.r,
                                            color: AppColors.starcolor)
                            ],
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          '3.2',
                          style: text2Regular(AppColors.primarymaincolor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Actor Name',
                    style: h2TextStyle(AppColors.blackColor),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Indian Actress',
                    style: text2Regular(AppColors.greyColor),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.access_time,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Duration 20 Mins',
                        style: text2Regular(AppColors.greyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: AppColors.greyColor,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Total Average Fees ₹9,999',
                        style: text2Regular(AppColors.greyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'About',
                    style: h2TextStyle(AppColors.blackColor),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                    style: text2Regular(AppColors.greyColor),
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'See More',
                        style: text2Regular(AppColors.primarymaincolor),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
