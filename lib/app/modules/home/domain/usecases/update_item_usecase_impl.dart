import 'package:dartz/dartz.dart';
import 'package:shopping_list_test/app/modules/home/domain/errors/errors.dart';
import 'package:shopping_list_test/app/modules/home/domain/interfaces/domain/update_item_usecase.dart';
import 'package:shopping_list_test/app/modules/home/infra/model/item_model.dart';

import '../interfaces/infra/item_repository.dart';

class UpdateItemUseCaseImpl implements UpdateItemUseCase {
  final ItemRepository repository;

  UpdateItemUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(ItemModel item) {
    return repository.updateItem(item);
  }
}
