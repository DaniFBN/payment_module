import 'package:payment_module/src/services/types.dart';

class ProductStore {
  final String id;
  final String title;
  final String description;
  final String formattedPrice;
  final double rawPrice;
  final String currencyCode;
  final String currencySymbol;

  ProductStore({
    required this.id,
    required this.title,
    required this.description,
    required this.formattedPrice,
    required this.rawPrice,
    required this.currencyCode,
    required this.currencySymbol,
  });
}

class LoadProductsPayload {
  final Set<IProductAppStore> products;

  LoadProductsPayload({required this.products});
}

class BuyPayload {
  final ProductStore product;

  BuyPayload({required this.product});
}
