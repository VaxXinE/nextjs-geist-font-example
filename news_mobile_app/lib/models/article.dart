class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String source;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? 'https://via.placeholder.com/300',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source']['name'] ?? '',
    );
  }
}
