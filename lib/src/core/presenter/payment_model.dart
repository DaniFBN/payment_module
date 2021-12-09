import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/services/types.dart';

class PaymentModel {
  final bool available;
  final Set<ProductStore> products;
  final Set<String> notFoundProducts;
  final Set<CustomPurchaseDetails> purchases;

  PaymentModel({
    required this.available,
    this.products = const {},
    this.notFoundProducts = const {},
    this.purchases = const {},
  });

  factory PaymentModel.initialState() {
    return PaymentModel(
      available: false,
    );
  }

  PaymentModel copyWith({
    bool? available,
    Set<ProductStore>? products,
    Set<String>? notFoundProducts,
    Set<CustomPurchaseDetails>? purchases,
  }) {
    return PaymentModel(
      available: available ?? this.available,
      products: products ?? this.products,
      notFoundProducts: notFoundProducts ?? this.notFoundProducts,
      purchases: purchases ?? this.purchases,
    );
  }
}
