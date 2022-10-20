import 'package:hive/hive.dart';

import '../../domain/entities/item.dart';
import '../../infra/interfaces/item_datasource.dart';
import '../../infra/model/item_model.dart';

class ItemDataSourceImpl implements ItemDataSource {
  @override
  List<Item>? getAllItem() {
    try {
      final boxItem = Hive.box<ItemModel>('item');
      var list = <Item>[];
      list.addAll(boxItem.values);
      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> saveItem(ItemModel item) async {
    try {
      int id = 0;

      final boxId = Hive.box<int>('id');
      if (boxId.isEmpty) {
        boxId.put('id', id);
      } else {
        var oldId = boxId.get('id')!;
        id = oldId+1;
        boxId.put('id', id);
      }

      item.id = id;
      final boxItem = Hive.box<ItemModel>('item');
      await boxItem.put(item.id, item);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateItem(ItemModel item) async {
    try {
      final boxItem = Hive.box<ItemModel>('item');
      await boxItem.put(item.id, item);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteItem(int id) async {
    try {
      final boxItem = Hive.box<ItemModel>('item');
      await boxItem.delete(id);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isItemEmpty() async {
    try {
      final boxItem = Hive.box<ItemModel>('item');
      return boxItem.isEmpty;
    } catch (e) {
      rethrow;
    }
  }
}
