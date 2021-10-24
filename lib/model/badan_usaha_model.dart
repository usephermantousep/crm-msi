part of 'models.dart';

class BadanUsahaModel extends Equatable {
  final int? id;
  final String? name;

  BadanUsahaModel({this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory BadanUsahaModel.fromJson(Map<String, dynamic> json) =>
      BadanUsahaModel(
        id: json['id'],
        name: json["name"],
      );
}
