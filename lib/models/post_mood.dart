// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

PostMood postFromJson(String str) => PostMood.fromJson(json.decode(str));

String postToJson(PostMood data) => json.encode(data.toJson());

class PostMood {
  PostMood({
    required this.id,
    this.mood,
    required this.date,
    required this.user,
  });

  int id;
  String? mood;
  DateTime date;
  int user;

  factory PostMood.fromJson(Map<String, dynamic> json) => PostMood(
        id: json["id"],
        mood: json["mood"],
        date: DateTime.parse(json["date"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mood": mood,
        "date": date.toIso8601String(),
        "user": user,
      };
}
