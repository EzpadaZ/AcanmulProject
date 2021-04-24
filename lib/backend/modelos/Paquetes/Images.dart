class Images {
  String url;

  Images({this.url});

  factory Images.fromJson(Map<String, dynamic> json) =>
      Images(url: json['url']);
}
