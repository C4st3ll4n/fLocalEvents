class Guest{
  final String imgPath;

  Guest(this.imgPath);
}
const imgBasePath = "assets/guest_images";
final guests = [
  Guest("$imgBasePath/guest1.jpg"),
  Guest("$imgBasePath/guest2.jpg"),
  Guest("$imgBasePath/guest3.jpg"),
  Guest("$imgBasePath/guest4.jpg"),
  Guest("$imgBasePath/guest5.jpg"),
  Guest("$imgBasePath/guest6.jpg"),
];