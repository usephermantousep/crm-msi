part of 'models.dart';

class Cluster extends Equatable {
  final int? id;
  final String? namaCluster;

  Cluster({this.id, this.namaCluster});

  @override
  List<Object?> get props => [id, namaCluster];

  factory Cluster.fromjson(Map<String, dynamic> data) => Cluster(
        id: data['id'],
        namaCluster: data['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_cluster': namaCluster,
      };
}
