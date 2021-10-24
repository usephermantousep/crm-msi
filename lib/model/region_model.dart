part of 'models.dart';

class RegionModel extends Equatable {
  final int? id;
  final String? name;

  RegionModel({this.id, this.name});

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        id: json['id'],
        name: json["name"],
      );
}
