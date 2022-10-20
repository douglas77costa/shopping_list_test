import 'package:get/get.dart';

import 'domain/usecases/delete_item_usecase_impl.dart';
import 'domain/usecases/get_all_item_usecase_impl.dart';
import 'domain/usecases/is_item_empty_usecase_impl.dart';
import 'domain/usecases/save_item_usecase_impl.dart';
import 'domain/usecases/update_item_usecase_impl.dart';
import 'external/storage/item_datasource_impl.dart';
import 'infra/repositories/item_repository_impl.dart';
import 'presenter/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ItemDataSourceImpl());
    Get.lazyPut(() => ItemRepositoryImpl(Get.find<ItemDataSourceImpl>()));

    Get.lazyPut(() => DeleteItemUseCaseImpl(Get.find<ItemRepositoryImpl>()));
    Get.lazyPut(() => GetAllItemUseCaseImpl(Get.find<ItemRepositoryImpl>()));
    Get.lazyPut(() => IsItemEmptyUseCaseImpl(Get.find<ItemRepositoryImpl>()));
    Get.lazyPut(() => SaveItemUseCaseImpl(Get.find<ItemRepositoryImpl>()));
    Get.lazyPut(() => UpdateItemUseCaseImpl(Get.find<ItemRepositoryImpl>()));

    Get.lazyPut(() => HomeController(
          getAllItemUseCase: Get.find<GetAllItemUseCaseImpl>(),
          isItemEmptyUseCase: Get.find<IsItemEmptyUseCaseImpl>(),
          updateItemUseCase: Get.find<UpdateItemUseCaseImpl>(),
        ));
  }
}
