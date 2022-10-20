import 'package:dartz/dartz.dart';

import '../../infra/model/item_model.dart';
import '../errors/errors.dart';
import '../interfaces/domain/save_item_usecase.dart';
import '../interfaces/infra/item_repository.dart';

class SaveItemUseCaseImpl implements SaveItemUseCase {
  final ItemRepository repository;

  SaveItemUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(ItemModel item) {
    return repository.saveItem(item);
  }
}
