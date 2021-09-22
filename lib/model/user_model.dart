part of 'models.dart';

class UserModel extends Equatable {
  UserModel({
    this.id,
    this.username,
    this.namaLengkap,
    this.region,
    this.cluster,
    this.roles,
    this.idNotif,
    this.profilePhotoPath,
  });

  final int? id;
  final String? username;
  final String? namaLengkap;
  final String? region;
  final Cluster? cluster;
  final String? roles;
  final String? idNotif;
  final String? profilePhotoPath;
  static String? token;
  @override
  List<Object?> get props => [
        id,
        username,
        namaLengkap,
        region,
        cluster,
        roles,
        profilePhotoPath,
      ];

  UserModel copyWith({
    final int? id,
    final String? username,
    final String? namaLengkap,
    final String? region,
    final Cluster? cluster,
    final String? roles,
    final String? profilePhotoPath,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        namaLengkap: namaLengkap ?? this.namaLengkap,
        region: region ?? this.region,
        cluster: cluster ?? this.cluster,
        roles: roles ?? this.roles,
        profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
      );

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        username: data['username'],
        namaLengkap: data['nama_lengkap'],
        region: data['region'],
        cluster: Cluster.fromjson(data['cluster']),
        roles: data['roles'],
        profilePhotoPath: data['profile_photo_path'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nama_lengkap": namaLengkap,
        "region": region,
        "cluster": Cluster(namaCluster: 'namacluster'),
        "roles": roles,
        "id_notif": idNotif,
        "profile_photo_path": profilePhotoPath,
      };
}
