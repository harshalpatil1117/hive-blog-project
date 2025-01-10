class HiveBlogRequest {
  int? id;
  String? jsonrpc;
  String? method;
  Params? params;

  HiveBlogRequest({this.id, this.jsonrpc, this.method, this.params});

  HiveBlogRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jsonrpc = json['jsonrpc'];
    method = json['method'];
    params =
    json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jsonrpc'] = this.jsonrpc;
    data['method'] = this.method;
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    return data;
  }
}

class Params {
  String? sort;
  String? tag;
  String? observer;

  Params({this.sort, this.tag, this.observer});

  Params.fromJson(Map<String, dynamic> json) {
    sort = json['sort'];
    tag = json['tag'];
    observer = json['observer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sort'] = this.sort;
    data['tag'] = this.tag;
    data['observer'] = this.observer;
    return data;
  }
}