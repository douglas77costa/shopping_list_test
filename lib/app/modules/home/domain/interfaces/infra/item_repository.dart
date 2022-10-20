import 'package:dartz/dartz.dart';

import '../../../infra/model/item_model.dart';
import '../../entities/item.dart';
import '../../errors/errors.dart';

abstract class ItemRepository {
  Either<Failure, List<Item>?> getAllItem();

  Future<Either<Failure, bool>> saveItem(ItemModel item);

  Future<Either<Failure, bool>> updateItem(ItemModel item);

  Future<Either<Failure, bool>> deleteItem(int id);

  Future<Either<Failure, bool>> isItemEmpty();
}
