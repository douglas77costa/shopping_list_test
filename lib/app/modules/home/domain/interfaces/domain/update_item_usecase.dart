import 'package:dartz/dartz.dart';

import '../../../infra/model/item_model.dart';
import '../../errors/errors.dart';

abstract class UpdateItemUseCase {
  Future<Either<Failure, bool>> call(ItemModel item);
}
