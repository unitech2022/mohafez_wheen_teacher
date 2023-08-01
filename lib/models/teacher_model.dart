class TeacherModel {
  List<String>? categories;
  List<Teachers>? teachers;

  TeacherModel({this.categories, this.teachers});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    categories = json['categories'].cast<String>();
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add( Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories;
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
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

  Teachers(
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

  Teachers.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['status'] = this.status;
    data['fromHours'] = this.fromHours;
    data['toHours'] = this.toHours;
    data['link'] = this.link;
    data['note'] = this.note;
    data['today'] = this.today;
    data['dateToday'] = this.dateToday;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
