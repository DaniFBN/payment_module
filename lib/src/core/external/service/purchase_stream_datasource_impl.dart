import 'package:payment_module/src/core/domain/entities/purchase_stream_entity.dart';
import 'package:payment_module/src/core/infra/datasources/purchase_stream_datasource_interface.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';

class PurchaseStreamDatasouceImpl implements IPurchaseStreamDatasource {
  final IPaymentService _service;

  PurchaseStreamDatasouceImpl(this._service);

  @override
  PurchaseStreamEntity getPurchaseStream() {
    return PurchaseStreamEntity(purchases: _service.purchases);
  }
}
