import 'package:payment_module/src/core/domain/entities/available_entity.dart';
import 'package:payment_module/src/core/infra/datasources/available_datasource_interface.dart';
import 'package:payment_module/src/services/payment_service_interface.dart';

class AvailableDatasourceImpl implements IAvailableDatasource {
  final IPaymentService _service;

  AvailableDatasourceImpl(this._service);

  @override
  Future<AvailableEntity> isAvailable() async {
    final response = await _service.isAvailable();

    return AvailableEntity(isAvailable: response);
  }
}
