class Background {
  Background(
      {required this.id,
        required this.name,
        required this.creator,
        required this.description,
        required this.colorTheme,
        required this.subColor,
        required this.downloads,
        required this.category,
        required this.size,
        required this.sizeImage,
        required this.imageUrl});

  final int id;
  final String name;
  final String creator;
  final String description;
  final String colorTheme;
  final String subColor;
  final int downloads;
  final String category;
  final String size;
  final double sizeImage;
  final String imageUrl;
}
