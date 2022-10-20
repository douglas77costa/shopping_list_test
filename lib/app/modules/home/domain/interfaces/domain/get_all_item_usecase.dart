import 'package:dartz/dartz.dart';

import '../../entities/item.dart';
import '../../errors/errors.dart';

abstract class GetAllItemUseCase {
  Either<Failure, List<Item>?> call();
}
