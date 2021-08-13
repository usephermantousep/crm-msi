part of 'models.dart';

class OutletModel extends Equatable {
  final int? id;
  final UserModel? namaSales;
  final String? namaOutlet;
  final String? region;
  final String? cluster;
  final String? latLong;
  final double? radius;

  OutletModel(
      {this.id,
      this.namaSales,
      this.namaOutlet,
      this.region,
      this.cluster,
      this.latLong,
      this.radius});

  factory OutletModel.fromJson(Map<String, dynamic> data) => OutletModel(
        id: data['id'],
        namaSales: data['nama_sales'],
        namaOutlet: data['nama_outlet'],
        region: data['region'],
        cluster: data['cluster'],
        latLong: data['latlong'],
        radius: data['radius'],
      );

  @override
  List<Object?> get props =>
      [id, namaSales, namaOutlet, region, cluster, latLong, radius];
}

List<OutletModel> mockOutlet = [
  OutletModel(
    id: 1,
    namaOutlet: "TOKO TUPAREV",
    namaSales: mockUser,
    region: "WJU",
    cluster: "WJ1",
    latLong: "-6.7108306020177455,108.53886410485876",
    radius: 50,
  ),
  OutletModel(
    id: 2,
    namaOutlet: "TOKO PERUM",
    namaSales: mockUser,
    region: "WJU",
    cluster: "WJ1",
    latLong: "-6.748829354494562,108.56074800552257",
    radius: 50,
  ),
  OutletModel(
    id: 3,
    namaOutlet: "TOKO PETRATEAN",
    namaSales: mockUser,
    region: "WJU",
    cluster: "WJ1",
    latLong: "-6.721455799999999,108.5637634",
    radius: 50,
  ),
  OutletModel(
    id: 3,
    namaOutlet: "TOKO JMS",
    namaSales: mockUser,
    region: "WJU",
    cluster: "WJ1",
    latLong: "-6.721455799999999,108.56376334",
    radius: 50,
  ),
];
