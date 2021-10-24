part of 'models.dart';

class UserModel extends Equatable {
  UserModel({
    this.username,
    this.namaLengkap,
    this.region,
    this.cluster,
    this.roles,
    this.divisi,
    this.badanUsaha,
    this.idNotif,
  });

  final String? username;
  final String? namaLengkap;
  final RegionModel? region;
  final ClusterModel? cluster;
  final RoleModel? roles;
  final DivisiModel? divisi;
  final BadanUsahaModel? badanUsaha;
  final String? idNotif;

  @override
  List<Object?> get props => [
        username,
        namaLengkap,
        region,
        cluster,
        roles,
        divisi,
        badanUsaha,
        idNotif,
      ];

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        username: data['username'],
        namaLengkap: data['nama_lengkap'],
        region: RegionModel.fromJson(data['region']),
        cluster: ClusterModel.fromJson(data['cluster']),
        roles: RoleModel.fromJson(data['role']),
        divisi: DivisiModel.fromJson(data['divisi']),
        badanUsaha: BadanUsahaModel.fromJson(data['badanusaha']),
        idNotif: data['id_notif'],
      );
}
