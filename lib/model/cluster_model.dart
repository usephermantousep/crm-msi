part of 'models.dart';

class ClusterModel extends Equatable {
  final int? id;
  final String? name;

  ClusterModel({this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory ClusterModel.fromJson(Map<String, dynamic> json) => ClusterModel(
        id: json['id'],
        name: json["name"],
      );
}
