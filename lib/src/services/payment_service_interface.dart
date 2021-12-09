import 'package:payment_module/src/core/domain/types.dart';

import 'types.dart';

abstract class IPaymentService {
  Future<bool> isAvailable();
  Future<LoadResponse> getProducts(Set<IProductAppStore> products);
  Future<void> buy(ProductStore product);
  Future<void> restorePurchases();
  Stream<Set<CustomPurchaseDetails>> get purchases;
}
