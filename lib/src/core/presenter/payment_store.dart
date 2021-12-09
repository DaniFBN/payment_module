import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:payment_module/src/core/domain/exceptions.dart';
import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/domain/usecases/available_usecase.dart';
import 'package:payment_module/src/core/domain/usecases/buy_usecase.dart';
import 'package:payment_module/src/core/domain/usecases/load_products_usecase.dart';
import 'package:payment_module/src/core/domain/usecases/purchase_stream_usecase.dart';
import 'package:payment_module/src/core/domain/usecases/restore_purchases_usecase.dart';
import 'package:payment_module/src/services/types.dart';

import 'payment_model.dart';

class PaymentStore extends NotifierStore<PaymentException, PaymentModel>
    implements Disposable {
  final Set<IProductAppStore> _searchedProducts;
  final IAvailableUsecase _availableUsecase;
  final ILoadProductsUsecase _loadProductsUsecase;
  final IBuyUsecase _buyUsecase;
  final IRestorePurchasesUsecase _restorePurchasesUsecase;
  final IPurchaseStreamUsecase _purchaseStreamUsecase;

  late StreamSubscription subcriptionStream;

  PaymentStore(
    this._searchedProducts,
    this._availableUsecase,
    this._loadProductsUsecase,
    this._buyUsecase,
    this._restorePurchasesUsecase,
    this._purchaseStreamUsecase,
  ) : super(PaymentModel.initialState()) {
    isAvailable().then((_) {
      loadProducts();
      final stream = _purchaseStreamUsecase()
          .purchases
          .map((e) => state.copyWith(purchases: {...e, ...state.purchases}));

      subcriptionStream = executeStream(stream);
    });
  }

  Future<void> isAvailable() async {
    setLoading(true);
    final response = await _availableUsecase();

    final available = response.fold(
      (e) => false,
      (r) => r.isAvailable,
    );

    final newState = state.copyWith(available: available);
    update(newState);

    setLoading(false);
  }

  Future<void> loadProducts() async {
    if (!state.available) return;
    setLoading(true);

    final payload = LoadProductsPayload(products: _searchedProducts);
    final products = await _loadProductsUsecase(payload);

    products.fold(
      (e) => setError(e),
      (r) {
        final newState = state.copyWith(
          products: r.products,
          notFoundProducts: r.notFoundIDs,
        );
        _restore();
        update(newState);
      },
    );

    setLoading(false);
  }

  Future<void> buy(ProductStore product) async {
    setLoading(true);

    final payload = BuyPayload(product: product);
    final response = await _buyUsecase(payload);

    response.fold(
      (e) => setError(e),
      (r) => _restore(),
    );

    setLoading(false);
  }

  Future<void> _restore() async {
    await _restorePurchasesUsecase();
  }

  @override
  void dispose() {
    subcriptionStream.cancel();
  }
}
