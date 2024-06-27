import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:promilo/model/home_model.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: dashgrid.length,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                // enlargeCenterPage: true,
                aspectRatio: 2,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              var data = dashgrid[index];
              return Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(data.image.toString(),
                                  height: 140,
                                  fit: BoxFit.cover,
                                  width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 140,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 10.0),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width: 200,
                                          child: Text(
                                            data.title.toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              );
            }),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 0; i < dashgrid.length; i++)
            GestureDetector(
              onTap: () => _controller.animateToPage(i),
              child: Container(
                width: _current == i ? 8.0 : 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius:
                        _current == i ? BorderRadius.circular(8.0) : null,
                    shape: _current == i ? BoxShape.rectangle : BoxShape.circle,
                    color: _current == i
                        ? Colors.black
                        : Colors.grey.withOpacity(0.5)),
              ),
            )
        ])
      ],
    );
  }
}
