class TableResponse {
  List<String>? categories;
  List<TableModel>? teachers;

  TableResponse({this.categories, this.teachers});

  TableResponse.fromJson(Map<String, dynamic> json) {
   categories=[];
     json['categories'].forEach((v) {
        categories!.add(v.toString().split("T")[0]);
      });
   
    if (json['teachers'] != null) {
      teachers = [];
      json['teachers'].forEach((v) {
        teachers!.add(TableModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['categories'] = categories;
    if (teachers != null) {
      data['teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TableModel {
  int? id;
  String? userId;
  int? status;
  String? fromHours;
  String? toHours;
  String? link;
  String? note;
  String? today;
  String? dateToday;
  String? createdAt;

  TableModel(
      {this.id,
      this.userId,
      this.status,
      this.fromHours,
      this.toHours,
      this.link,
      this.note,
      this.today,
      this.dateToday,
      this.createdAt});

  TableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    status = json['status'];
    fromHours = json['fromHours'];
    toHours = json['toHours'];
    link = json['link'];
    note = json['note'];
    today = json['today'];
    dateToday = json['dateToday'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['userId'] = userId;
    data['status'] = status;
    data['fromHours'] = fromHours;
    data['toHours'] = toHours;
    data['link'] = link;
    data['note'] = note;
    data['today'] = today;
    data['dateToday'] = dateToday;
    data['createdAt'] = createdAt;
    return data;
  }
}
