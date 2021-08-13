part of 'models.dart';

class VisitModel extends Equatable {
  final int? id;
  final int? userId;
  final int? outletId;
  final DateTime? tanggalVisit;
  final String? latLongIn;
  final String? latLongOut;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final String? pictureVisitIn;
  final String? pictureVisitOut;
  final int? durasiVisit;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final UserModel? user;
  final OutletModel? outlet;

  VisitModel(
      {this.id,
      this.userId,
      this.outletId,
      this.tanggalVisit,
      this.latLongIn,
      this.latLongOut,
      this.checkInTime,
      this.checkOutTime,
      this.pictureVisitIn,
      this.pictureVisitOut,
      this.durasiVisit,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.outlet});

  @override
  List<Object?> get props => [
        id,
        userId,
        outletId,
        tanggalVisit,
        latLongIn,
        latLongOut,
        checkInTime,
        checkOutTime,
        pictureVisitIn,
        pictureVisitOut,
        durasiVisit,
        deletedAt,
        updatedAt,
        createdAt,
        user,
        outlet,
      ];

  factory VisitModel.fromJson(Map<String, dynamic> data) => VisitModel(
        id: data['id'],
      );
}

List<VisitModel> mockVisit = [
  VisitModel(
    id: 1,
    outletId: 1,
    tanggalVisit: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    latLongIn: "-6.748829354494562,108.56074800552257",
    latLongOut: "-6.748829354494562,108.56074800552257",
    checkInTime: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    checkOutTime: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    pictureVisitIn: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    pictureVisitOut: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    durasiVisit: 20,
    deletedAt: null,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    user: mockUser,
    outlet: mockOutlet[0],
  ),
  VisitModel(
    id: 1,
    outletId: 2,
    tanggalVisit: DateTime.fromMillisecondsSinceEpoch(1600863723),
    latLongIn: "-6.748829354494562,108.56074800552257",
    latLongOut: "-6.748829354494562,108.56074800552257",
    checkInTime: DateTime.fromMillisecondsSinceEpoch(1600863723),
    checkOutTime: DateTime.fromMillisecondsSinceEpoch(1600863723),
    pictureVisitIn: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    pictureVisitOut: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    durasiVisit: 20,
    deletedAt: null,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1600863723),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1600863723),
    user: mockUser,
    outlet: mockOutlet[1],
  ),
  VisitModel(
    id: 1,
    outletId: 3,
    tanggalVisit: DateTime.fromMillisecondsSinceEpoch(1600863723),
    latLongIn: "-6.748829354494562,108.56074800552257",
    latLongOut: "-6.748829354494562,108.56074800552257",
    checkInTime: DateTime.fromMillisecondsSinceEpoch(1600863723),
    checkOutTime: DateTime.fromMillisecondsSinceEpoch(1600863723),
    pictureVisitIn: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    pictureVisitOut: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    durasiVisit: 20,
    deletedAt: null,
    createdAt: DateTime.fromMillisecondsSinceEpoch(1600863723),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1600863723),
    user: mockUser,
    outlet: mockOutlet[2],
  ),
];
