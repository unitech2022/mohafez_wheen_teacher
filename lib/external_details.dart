class ExternalDetails {
  Trip? trip;
  Driver? driver;
  ProfileDriver? profileDriver;
  bool? isBooking;

  ExternalDetails({this.trip, this.driver, this.profileDriver, this.isBooking});

  ExternalDetails.fromJson(Map<String, dynamic> json) {
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
    profileDriver = json['profileDriver'] != null
        ? new ProfileDriver.fromJson(json['profileDriver'])
        : null;
    isBooking = json['isBooking'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trip != null) {
      data['trip'] = this.trip!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    if (this.profileDriver != null) {
      data['profileDriver'] = this.profileDriver!.toJson();
    }
    data['isBooking'] = this.isBooking;
    return data;
  }
}

class Trip {
  int? id;
  int? driverId;
  String? name;
  int? price;
  Null? userId;
  String? startCity;
  String? endCity;
  double? startPointLat;
  double? startPointLng;
  double? endPointLat;
  double? endPointLng;
  int? sets;
  int? status;
  int? bookings;
  String? startingAt;
  String? endTime;
  String? createdAt;

  Trip(
      {this.id,
      this.driverId,
      this.name,
      this.price,
      this.userId,
      this.startCity,
      this.endCity,
      this.startPointLat,
      this.startPointLng,
      this.endPointLat,
      this.endPointLng,
      this.sets,
      this.status,
      this.bookings,
      this.startingAt,
      this.endTime,
      this.createdAt});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driverId'];
    name = json['name'];
    price = json['price'];
    userId = json['userId'];
    startCity = json['startCity'];
    endCity = json['endCity'];
    startPointLat = json['startPointLat'];
    startPointLng = json['startPointLng'];
    endPointLat = json['endPointLat'];
    endPointLng = json['endPointLng'];
    sets = json['sets'];
    status = json['status'];
    bookings = json['bookings'];
    startingAt = json['startingAt'];
    endTime = json['endTime'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driverId'] = this.driverId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['userId'] = this.userId;
    data['startCity'] = this.startCity;
    data['endCity'] = this.endCity;
    data['startPointLat'] = this.startPointLat;
    data['startPointLng'] = this.startPointLng;
    data['endPointLat'] = this.endPointLat;
    data['endPointLng'] = this.endPointLng;
    data['sets'] = this.sets;
    data['status'] = this.status;
    data['bookings'] = this.bookings;
    data['startingAt'] = this.startingAt;
    data['endTime'] = this.endTime;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Driver {
  int? id;
  String? userId;
  double? lat;
  double? lng;
  int? zoneId;
  String? passport;
  String? drivingLicense;
  String? carImage;
  int? carModelId;
  String? carMakeYear;
  int? status;
  int? rate;
  String? createdAt;

  Driver(
      {this.id,
      this.userId,
      this.lat,
      this.lng,
      this.zoneId,
      this.passport,
      this.drivingLicense,
      this.carImage,
      this.carModelId,
      this.carMakeYear,
      this.status,
      this.rate,
      this.createdAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    lat = json['lat'];
    lng = json['lng'];
    zoneId = json['zoneId'];
    passport = json['passport'];
    drivingLicense = json['drivingLicense'];
    carImage = json['carImage'];
    carModelId = json['carModelId'];
    carMakeYear = json['carMakeYear'];
    status = json['status'];
    rate = json['rate'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['zoneId'] = this.zoneId;
    data['passport'] = this.passport;
    data['drivingLicense'] = this.drivingLicense;
    data['carImage'] = this.carImage;
    data['carModelId'] = this.carModelId;
    data['carMakeYear'] = this.carMakeYear;
    data['status'] = this.status;
    data['rate'] = this.rate;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class ProfileDriver {
  String? id;
  String? fullName;
  String? userName;
  String? email;
  Null? profileImage;
  String? role;
  String? deviceToken;
  String? status;
  String? code;
  Null? gender;
  Null? city;
  Null? birth;
  String? points;
  String? surveysBalance;
  String? createdAt;

  ProfileDriver(
      {this.id,
      this.fullName,
      this.userName,
      this.email,
      this.profileImage,
      this.role,
      this.deviceToken,
      this.status,
      this.code,
      this.gender,
      this.city,
      this.birth,
      this.points,
      this.surveysBalance,
      this.createdAt});

  ProfileDriver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    profileImage = json['profileImage'];
    role = json['role'];
    deviceToken = json['deviceToken'];
    status = json['status'];
    code = json['code'];
    gender = json['gender'];
    city = json['city'];
    birth = json['birth'];
    points = json['points'];
    surveysBalance = json['surveysBalance'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['role'] = this.role;
    data['deviceToken'] = this.deviceToken;
    data['status'] = this.status;
    data['code'] = this.code;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birth'] = this.birth;
    data['points'] = this.points;
    data['surveysBalance'] = this.surveysBalance;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
