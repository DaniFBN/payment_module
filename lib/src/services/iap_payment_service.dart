import 'dart:async';

import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';
import 'package:payment_module/src/services/types.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';

class IAPPaymentService implements IPaymentService {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  @override
  Stream<Set<CustomPurchaseDetails>> get purchases {
    return _inAppPurchase.purchaseStream.map(_convertPurchaseProducts);
  }

  @override
  Future<void> buy(ProductStore product) async {
    final purchaseParam = GooglePlayPurchaseParam(
      productDetails: _convert2ProductStore(product),
      applicationUserName: null,
      changeSubscriptionParam: null,
    );

    _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  @override
  Future<LoadResponse> getProducts(Set<IProductAppStore> appProducts) async {
    final products = _convertAppProducts(appProducts);

    final queryResponse = await _inAppPurchase.queryProductDetails(products);

    if (queryResponse.error != null) {
      throw PaymentException(queryResponse.error!.message);
    }
    if (queryResponse.productDetails.isEmpty) {
      throw EmptyProductsException('Dont have products');
    }

    return LoadResponse(
      products: _convertProducts(queryResponse.productDetails),
      notFoundIDs: queryResponse.notFoundIDs.toSet(),
    );
  }

  @override
  Future<bool> isAvailable() async {
    return await _inAppPurchase.isAvailable();
  }

  @override
  Future<void> restorePurchases() async {
    await _inAppPurchase.restorePurchases();
  }

  Set<String> _convertAppProducts(Set<IProductAppStore> products) {
    return products.map((e) => e.name).toSet();
  }

  Set<CustomPurchaseDetails> _convertPurchaseProducts(
    List<PurchaseDetails> purchases,
  ) {
    return purchases
        .map((e) => CustomPurchaseDetails(
            productID: e.productID,
            status: _convertStatus(e.status),
            transactionDate: e.transactionDate,
            purchaseID: e.purchaseID))
        .toSet();
  }

  CustomPurchaseStatus _convertStatus(PurchaseStatus status) {
    return CustomPurchaseStatus.values[status.index];
  }

  Set<ProductStore> _convertProducts(List<ProductDetails> products) {
    return products.map(_convertProduct).toSet();
  }

  ProductStore _convertProduct(ProductDetails product) {
    return ProductStore(
      id: product.id,
      title: product.title,
      description: product.description,
      formattedPrice: product.price,
      rawPrice: product.rawPrice,
      currencyCode: product.currencyCode,
      currencySymbol: product.currencySymbol,
    );
  }

  ProductDetails _convert2ProductStore(ProductStore product) {
    return ProductDetails(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.formattedPrice,
      rawPrice: product.rawPrice,
      currencyCode: product.currencyCode,
      currencySymbol: product.currencySymbol,
    );
  }
}
