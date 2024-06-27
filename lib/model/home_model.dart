class HomeModel {
  String? image;
  String? title;

  HomeModel({
    this.image,
    this.title,
  });
}

List<HomeModel> dashgrid = [
  HomeModel(
    title: 'Popular Meetups In India',
    image: 'assets/images/banner1.jpeg',
  ),
  HomeModel(
    title: 'Popular Meetups In Uk',
    image: 'assets/images/banner2.jpeg',
  ),
  HomeModel(
    title: 'Popular Meetups In USA',
    image: 'assets/images/banner3.jpg',
  ),
];
