import 'package:hive/hive.dart';

import '../../domain/entities/item.dart';

part 'item_model.g.dart';

@HiveType(typeId: 1)
class ItemModel extends Item {
  ItemModel({required super.id, required super.name, required super.check});

  @override
  @HiveField(0)
  int get id => super.id;

  @override
  @HiveField(1)
  String get name => super.name;

  @override
  @HiveField(2)
  bool get check => super.check;
}
