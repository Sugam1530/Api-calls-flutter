
class PostsModel {
  late int userId;
  late int id;
  late String title;
  late String body;

  PostsModel({required this.userId, required this.id, required this.title, required this.body});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if(json["userId"] is int)
      this.userId = json["userId"];
    if(json["id"] is int)
      this.id = json["id"];
    if(json["title"] is String)
      this.title = json["title"];
    if(json["body"] is String)
      this.body = json["body"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["userId"] = this.userId;
    data["id"] = this.id;
    data["title"] = this.title;
    data["body"] = this.body;
    return data;
  }
}