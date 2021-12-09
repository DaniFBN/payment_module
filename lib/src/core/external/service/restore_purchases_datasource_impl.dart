import 'package:payment_module/src/core/domain/entities/restore_purchases_entity.dart';
import 'package:payment_module/src/core/infra/datasources/restore_purchases_datasource_interface.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';

class RestorePurchasesDatasourceImpl implements IRestorePurchasesDatasource {
  final IPaymentService _service;

  RestorePurchasesDatasourceImpl(this._service);

  @override
  Future<RestorePurchasesEntity> restore() async {
    await _service.restorePurchases();
    return RestorePurchasesEntity();
  }
}
