import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../interfaces/domain/is_item_empty_usecase.dart';
import '../interfaces/infra/item_repository.dart';

class IsItemEmptyUseCaseImpl implements IsItemEmptyUseCase {
  final ItemRepository repository;

  IsItemEmptyUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call() {
    return repository.isItemEmpty();
  }
}
