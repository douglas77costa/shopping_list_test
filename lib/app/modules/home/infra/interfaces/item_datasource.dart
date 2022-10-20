import '../../domain/entities/item.dart';
import '../model/item_model.dart';

abstract class ItemDataSource {
  List<Item>? getAllItem();

  Future<bool> saveItem(ItemModel item);

  Future<bool> updateItem(ItemModel item);

  Future<bool> deleteItem(int id);

  Future<bool> isItemEmpty();
}
