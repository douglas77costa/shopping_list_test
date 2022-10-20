import 'package:dartz/dartz.dart';

import '../../errors/errors.dart';

abstract class IsItemEmptyUseCase {
  Future<Either<Failure, bool>> call();
}
