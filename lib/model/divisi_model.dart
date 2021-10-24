part of 'models.dart';

class DivisiModel extends Equatable {
  final int? id;
  final String? name;

  DivisiModel({this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory DivisiModel.fromJson(Map<String, dynamic> json) => DivisiModel(
        id: json['id'],
        name: json["name"],
      );
}
