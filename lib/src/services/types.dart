import 'package:payment_module/src/core/domain/types.dart';

abstract class IProductAppStore {
  final String name;

  IProductAppStore({required this.name});
}

class SubscriptionProduct implements IProductAppStore {
  @override
  final String name;

  SubscriptionProduct({required this.name});
}

class CustomPurchaseDetails {
  final String? purchaseID;
  final String productID;
  final String? transactionDate;
  CustomPurchaseStatus status;

  CustomPurchaseDetails({
    required this.productID,
    required this.transactionDate,
    required this.status,
    this.purchaseID,
  });
}

enum CustomPurchaseStatus {
  pending,
  purchased,
  error,
  restored,
  canceled,
}

class LoadResponse {
  final Set<ProductStore> products;
  final Set<String> notFoundIDs;

  LoadResponse({required this.products, required this.notFoundIDs});
}
