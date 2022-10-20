import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';

abstract class DeleteItemUseCase {
  Future<Either<Failure, bool>> call(int id);
}
