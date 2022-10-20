import 'package:dartz/dartz.dart';

import '../entities/item.dart';
import '../errors/errors.dart';
import '../interfaces/domain/get_all_item_usecase.dart';
import '../interfaces/infra/item_repository.dart';

class GetAllItemUseCaseImpl implements GetAllItemUseCase {
  final ItemRepository repository;

  GetAllItemUseCaseImpl(this.repository);

  @override
  Either<Failure, List<Item>?> call() {
    return repository.getAllItem();
  }
}
