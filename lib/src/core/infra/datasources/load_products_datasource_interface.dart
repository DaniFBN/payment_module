import 'package:payment_module/src/core/domain/entities/load_products_entity.dart';
import 'package:payment_module/src/core/domain/types.dart';

abstract class ILoadProductsDatasource {
  Future<LoadProductsEntity> loadProducts(LoadProductsPayload payload);
}
