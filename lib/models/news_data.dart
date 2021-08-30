class NewsData {
  late final String author;
  late final String title;
  late final String description;
  late final String publishedAt;
  late final String urlToImage;
  late final String name;
  late final bool error;

  NewsData(
      {required this.author,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.urlToImage,
      required this.error,
      required this.name});
}
