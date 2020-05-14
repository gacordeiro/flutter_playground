final String baseUrl = "https://jsonplaceholder.typicode.com/photos/";

class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
