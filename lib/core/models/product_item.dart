class ProductItem {
  final String title;
  final String? image;
  final bool isFavorite;

  ProductItem({
    required this.title,
    this.image,
    this.isFavorite = false,
  });

  ProductItem copyWith({bool? isFavorite}) {
    return ProductItem(
      title: title,
      image: image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
