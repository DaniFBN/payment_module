import 'package:flutter_modular/flutter_modular.dart';

import 'package:payment_module/src/services/iap_payment_service.dart';
import 'package:payment_module/src/services/types.dart';

import 'domain/usecases/available_usecase.dart';
import 'domain/usecases/buy_usecase.dart';
import 'domain/usecases/load_products_usecase.dart';
import 'domain/usecases/purchase_stream_usecase.dart';
import 'domain/usecases/restore_purchases_usecase.dart';

import 'external/service/available_datasource_impl.dart';
import 'external/service/buy_datasource_impl.dart';
import 'external/service/load_products_datasource_impl.dart';
import 'external/service/purchase_stream_datasource_impl.dart';
import 'external/service/restore_purchases_datasource_impl.dart';

import 'infra/repositories/available_repository_impl.dart';
import 'infra/repositories/buy_repository_impl.dart';
import 'infra/repositories/load_products_repository_impl.dart';
import 'infra/repositories/purchase_stream_repository_impl.dart';
import 'infra/repositories/restore_purchases_repository_impl.dart';

import 'presenter/payment_store.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    // Products in PlayStore
    Bind.singleton((i) => {SubscriptionProduct(name: 'premium')}, export: true),

    // PaymentService
    Bind.singleton((i) => IAPPaymentService(), export: true),

    // Available
    Bind.singleton((i) => AvailableDatasourceImpl(i()), export: true),
    Bind.singleton((i) => AvailableRepositoryImpl(i()), export: true),
    Bind.singleton((i) => AvailableUsecase(i()), export: true),

    // LoadProducts
    Bind.singleton((i) => LoadProductsDatasourceImpl(i()), export: true),
    Bind.singleton((i) => LoadProductsRepositoryImpl(i()), export: true),
    Bind.singleton((i) => LoadProductsUsecase(i()), export: true),

    // Buy
    Bind.singleton((i) => BuyDatasourceImpl(i()), export: true),
    Bind.singleton((i) => BuyRepositoryImpl(i()), export: true),
    Bind.singleton((i) => BuyUsecase(i()), export: true),

    // RestorePurchases
    Bind.singleton((i) => RestorePurchasesDatasourceImpl(i()), export: true),
    Bind.singleton((i) => RestorePurchasesRepositoryImpl(i()), export: true),
    Bind.singleton((i) => RestorePurchasesUsecase(i()), export: true),

    // PurchaseStream
    Bind.singleton((i) => PurchaseStreamDatasouceImpl(i()), export: true),
    Bind.singleton((i) => PurchaseStreamRepositoryImpl(i()), export: true),
    Bind.singleton((i) => PurchaseStreamUsecase(i()), export: true),

    // Store
    Bind.singleton(
      (i) => PaymentStore(i(), i(), i(), i(), i(), i()),
      export: true,
    )
  ];
}
