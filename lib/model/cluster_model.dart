part of 'models.dart';

class Cluster extends Equatable {
  final int? id;
  final String? namaCluster;
  final String? region;

  Cluster({this.id, this.namaCluster, this.region});

  @override
  List<Object?> get props => [id, namaCluster, region];

  factory Cluster.fromjson(Map<String, dynamic> data) => Cluster(
        id: data['id'],
        namaCluster: data['name'],
        region: data['region'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama_cluster': namaCluster,
        'region': region,
      };
}
