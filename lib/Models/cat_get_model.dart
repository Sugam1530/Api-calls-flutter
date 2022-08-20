class CatGet {
  late int count;
  late List<Entries> entries;

  CatGet({required this.count, required this.entries});

  CatGet.fromJson(Map<String, dynamic> json) {
    if(json["count"] is int)
      this.count = json["count"];
    if(json["entries"] is List)
      this.entries = (json["entries"]==null ? null : (json["entries"] as List).map((e)=>Entries.fromJson(e)).toList())!;
  }
  CatGet.setCount(int count){
    this.count = count;
  }
  CatGet.setEntries(List<Entries> entries){
    this.entries = entries;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["count"] = this.count;
    if(this.entries != null)
      data["entries"] = this.entries.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Entries {
  late String api;
  late String description;
  late String auth;
  late bool https;
  late String cors;
  late String link;
  late String category;

  Entries({required this.api, required this.description, required this.auth, required this.https, required this.cors, required this.link, required this.category});

  Entries.fromJson(Map<String, dynamic> json) {
    if(json["API"] is String)
      this.api = json["API"];
    if(json["Description"] is String)
      this.description = json["Description"];
    if(json["Auth"] is String)
      this.auth = json["Auth"];
    if(json["HTTPS"] is bool)
      this.https = json["HTTPS"];
    if(json["Cors"] is String)
      this.cors = json["Cors"];
    if(json["Link"] is String)
      this.link = json["Link"];
    if(json["Category"] is String)
      this.category = json["Category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["API"] = this.api;
    data["Description"] = this.description;
    data["Auth"] = this.auth;
    data["HTTPS"] = this.https;
    data["Cors"] = this.cors;
    data["Link"] = this.link;
    data["Category"] = this.category;
    return data;
  }
}

