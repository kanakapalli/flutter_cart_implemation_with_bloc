class Dishes {
  final String id;

  final String title;
  final String subtitle;
  final bool isVeg;
  final double price;

  Dishes({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.isVeg,
    required this.price,
  });

  factory Dishes.fromJson(Map<String, dynamic> json) => Dishes(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        isVeg: json["isVeg"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "isVeg": isVeg,
        "price": price,
      };
}

List<Dishes> dishesList = [
  Dishes(
    id: "1",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "2",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "3",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "4",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "5",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "6",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "7",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "8",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
  Dishes(
    id: "9",
    title: "title",
    subtitle: "subtitle",
    isVeg: false,
    price: 14.4,
  ),
];
