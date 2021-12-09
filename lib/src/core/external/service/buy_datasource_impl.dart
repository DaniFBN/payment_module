import 'package:payment_module/src/core/domain/types.dart';
import 'package:payment_module/src/core/domain/entities/buy_entity.dart';
import 'package:payment_module/src/core/infra/datasources/buy_datasource_interface.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';

class BuyDatasourceImpl implements IBuyDatasource {
  final IPaymentService service;

  BuyDatasourceImpl(this.service);

  @override
  Future<BuyEntity> buy(BuyPayload payload) async {
    await service.buy(payload.product);

    return BuyEntity();
  }
}
