import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../interfaces/domain/delete_item_usecase.dart';
import '../interfaces/infra/item_repository.dart';

class DeleteItemUseCaseImpl implements DeleteItemUseCase {
  final ItemRepository repository;

  DeleteItemUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(int id) {
    return repository.deleteItem(id);
  }
}
