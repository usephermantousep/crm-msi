part of 'models.dart';

class UserModel extends Equatable {
  final int? id;
  final String? userName;
  final String? nama;
  final String? region;
  final String? cluster;
  final String? roles;
  final String? potoUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel(
      {this.id,
      this.userName,
      this.nama,
      this.region,
      this.cluster,
      this.roles,
      this.potoUrl,
      this.createdAt,
      this.updatedAt});
  @override
  List<Object?> get props =>
      [id, userName, region, cluster, roles, potoUrl, createdAt, updatedAt];

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
      );
}

UserModel mockUser = UserModel(
  id: 1,
  userName: "USEP",
  nama: "USEP HERMANTO",
  region: "WJU",
  cluster: "WJ1",
  roles: "SALES",
  potoUrl: "http://servercsa1.sytes.net:3900/itsupport/member/usep.jpg",
  createdAt: DateTime.fromMillisecondsSinceEpoch(1627667510),
  updatedAt: DateTime.fromMillisecondsSinceEpoch(1627667510),
);
