import 'package:clean_dart_1/modules/search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  final String title;
  final String content;
  final String img;

  SearchResultModel({this.title, this.content, this.img});

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    return SearchResultModel(
      title: map['title'],
      content: map['content'],
      img: map['img'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'content': this.content,
      'img': this.img,
    };
  }
}
