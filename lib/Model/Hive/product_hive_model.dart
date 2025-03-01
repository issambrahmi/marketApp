import 'package:get/get.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ProductHiveModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? categorieName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final double priceD;
  @HiveField(5)
  final double priceG;
  @HiveField(6)
  final double priceSG;
  @HiveField(7)
  final int minQntG;
  @HiveField(8)
  final int minQntSG;
    @HiveField(9)
  final RxBool isFavorite;

  ProductHiveModel({
    required this.id,
    required this.name,
    this.categorieName,
    this.image,
    required this.priceD,
    required this.priceG,
    required this.priceSG,
    required this.minQntG,
    required this.minQntSG,
    required this.isFavorite
  });
}
