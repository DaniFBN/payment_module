import 'package:payment_module/src/core/domain/types.dart';

class LoadProductsEntity {
  final Set<ProductStore> products;
  final Set<String> notFoundIDs;

  LoadProductsEntity({required this.products, required this.notFoundIDs});
}
