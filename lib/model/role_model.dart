part of 'models.dart';

class RoleModel extends Equatable {
  final int? id;
  final String? name;

  RoleModel({this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'],
        name: json["name"],
      );
}
