import 'package:json_annotation/json_annotation.dart';
part 'person.g.dart';

@JsonSerializable()
class Person {
  final String id;
  final String name;
  final String phone;
  final String createdAt;

  Person(
      {required this.id,
      required this.name,
      required this.phone,
      required this.createdAt});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  String toString() {
    return 'Person(id: $id, name: $name, phone: $phone, createdAt: $createdAt)';
  }
}
