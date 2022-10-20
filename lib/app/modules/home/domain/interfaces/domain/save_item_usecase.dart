import 'package:dartz/dartz.dart';

import '../../../infra/model/item_model.dart';
import '../../errors/errors.dart';

abstract class SaveItemUseCase {
  Future<Either<Failure, bool>> call(ItemModel item);
}
