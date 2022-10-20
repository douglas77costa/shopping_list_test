import 'package:dartz/dartz.dart';
import 'package:shopping_list_test/app/modules/home/infra/interfaces/item_datasource.dart';

import '../../domain/entities/item.dart';
import '../../domain/errors/errors.dart';
import '../../domain/interfaces/infra/item_repository.dart';
import '../model/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemDataSource dataSource;

  ItemRepositoryImpl(this.dataSource);

  @override
  Either<Failure, List<Item>?> getAllItem() {
    try {
      var list = dataSource.getAllItem();
      if (list != null && list.isNotEmpty) {
        return right(list);
      } else {
        return left(EmptyResult());
      }
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteItem(int id) async {
    try {
      return right(await dataSource.deleteItem(id));
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>> isItemEmpty() async {
    try {
      return right(await dataSource.isItemEmpty());
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveItem(ItemModel item) async {
    try {
      return right(await dataSource.saveItem(item));
    } catch (e) {
      return left(Failure(message: e));
    }
  }

  @override
  Future<Either<Failure, bool>> updateItem(ItemModel item) async {
    try {
      return right(await dataSource.updateItem(item));
    } catch (e) {
      return left(Failure(message: e));
    }
  }
}
