import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  final String title;
  final String content;
  final String img;

  SearchResultModel({this.title, this.content, this.img});

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      title: map['login'] ?? "",
      content: map['url'] ?? "",
      img: map['avatar_url'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'login': this.title,
      'url': this.content,
      'avatar_url': this.img,
    };
  }
}
