// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  User user;
  String mediaUrl;
  String button1;
  String button2;

  ProfileModel({
    required this.message,
    required this.user,
     this.mediaUrl='',
    required this.button1,
    required this.button2,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json["Message"],
    user: User.fromJson(json["user"]),
    mediaUrl: json["media_url"],
    button1: json["button1"],
    button2: json["button2"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "user": user.toJson(),
    "media_url": mediaUrl,
    "button1": button1,
    "button2": button2,
  };
}

class User {
  int id;
  String firstName;
  String lastName;
  dynamic userIdentifier;
  DateTime birthDate;
  String email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  String currentLocation;
  DateTime programmingAge;
  String gender;
  String bio;
  String country;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> media;
  Student student;
  Expert expert;
  Specialty specialty;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.userIdentifier,
    required this.birthDate,
    required this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    required this.currentLocation,
    required this.programmingAge,
    required this.gender,
    required this.bio,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    required this.media,
    required this.student,
    required this.expert,
    required this.specialty,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    userIdentifier: json["user_identifier"],
    birthDate: DateTime.parse(json["birth_date"]),
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phoneNumber: json["phone_number"],
    currentLocation: json["current_location"],
    programmingAge: DateTime.parse(json["programming_age"]),
    gender: json["gender"],
    bio: json["bio"],
    country: json["country"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    media: List<dynamic>.from(json["media"].map((x) => x)),
    student: Student.fromJson(json["student"]),
    expert: Expert.fromJson(json["expert"]),
    specialty: Specialty.fromJson(json["specialty"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "user_identifier": userIdentifier,
    "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone_number": phoneNumber,
    "current_location": currentLocation,
    "programming_age": "${programmingAge.year.toString().padLeft(4, '0')}-${programmingAge.month.toString().padLeft(2, '0')}-${programmingAge.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "bio": bio,
    "country": country,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "media": List<dynamic>.from(media.map((x) => x)),
    "student": student.toJson(),
    "expert": expert.toJson(),
    "specialty": specialty.toJson(),
  };
}

class Expert {
  int id;
  String companies;
  int yearsAsExpert;
  String workAtCompany;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Expert({
    required this.id,
    required this.companies,
    required this.yearsAsExpert,
    required this.workAtCompany,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Expert.fromJson(Map<String, dynamic> json) => Expert(
    id: json["id"],
    companies: json["companies"],
    yearsAsExpert: json["years_as_expert"],
    workAtCompany: json["work_at_company"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companies": companies,
    "years_as_expert": yearsAsExpert,
    "work_at_company": workAtCompany,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Specialty {
  int id;
  String specialty;
  String section;
  String framework;
  String language;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Specialty({
    required this.id,
    required this.specialty,
    required this.section,
    required this.framework,
    required this.language,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) => Specialty(
    id: json["id"],
    specialty: json["specialty"],
    section: json["section"],
    framework: json["framework"],
    language: json["language"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "specialty": specialty,
    "section": section,
    "framework": framework,
    "language": language,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Student {
  int id;
  String studySemester;
  int currentYear;
  String section;
  String studySequence;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  Student({
    required this.id,
    required this.studySemester,
    required this.currentYear,
    required this.section,
    required this.studySequence,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"],
    studySemester: json["study_semester"],
    currentYear: json["current_year"],
    section: json["section"],
    studySequence: json["study_sequence"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "study_semester": studySemester,
    "current_year": currentYear,
    "section": section,
    "study_sequence": studySequence,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
